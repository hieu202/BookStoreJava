package com.devpro.javaweb22.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb22.dto.ProductSearch;
import com.devpro.javaweb22.model.Product;
import com.devpro.javaweb22.model.ProductImages;
import com.github.slugify.Slugify;

@Service
public class ProductService extends BaseService<Product> {

	@Autowired
	private ProductImagesService productImagesService;
		
	@Override
	protected Class<Product> clazz() {
		return Product.class;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 */
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}

	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	/**
	 * tạo tên file upload
	 */
	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}
	
	/**
	 * thêm mới sản phẩm
	 */
	@Transactional
	public Product addProduct(Product product, MultipartFile productAvatar, MultipartFile[] productPictures) throws IllegalStateException, IOException {
		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.

			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());

			// tạo đường dẫn tới file chứa avatar
			String pathToAvatar = "E:/upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar));

			product.setAvatar("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());

				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("E:/upload/product/pictures/" + fileName));

				// tạo mới 1 bản ghi product_images
				ProductImages productImages = new ProductImages();
				productImages.setPath("product/pictures/" + fileName);
				productImages.setTitle(fileName);

				product.addProductImages(productImages);
			}
		}

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
						product.setSeo(new Slugify().slugify(product.getTitle() + "-" + System.currentTimeMillis()));

		// lưu vào database
		return super.saveOrUpdate(product);
	}
	
	/**
	 * chỉnh sửa sản phẩm
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@Transactional
	public Product editProduct(Product product, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {
		// lấy thông tin cũ của product theo id
		Product productInDb = super.getById(product.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("E:/upload/" + productInDb.getAvatar()).delete();

			// update avatar mới
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			productAvatar.transferTo(new File("E:/upload/product/avatar/" + fileName));
			product.setAvatar("product/avatar/" + fileName);
		} else {
			// sử dụng lại avartar cũ
			product.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImages() != null && productInDb.getProductImages().size() > 0) {
				for (ProductImages opi : productInDb.getProductImages()) {
					// xóa avatar trong folder lên
					new File("E:/upload/" + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productImagesService.delete(opi);
				}
			}

			// update pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				pic.transferTo(new File("E:/upload/product/pictures/" + fileName));
				
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				
				product.addProductImages(pi);
			}
		}

		//tạo seo
				productInDb.setSeo(new Slugify().slugify(productInDb.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(product);
	}
	
	public PagerData<Product> searchProduct(ProductSearch searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";

		if (searchModel != null) {
			
			// tìm kiếm theo category
			if(searchModel.getCategoryId() != null && !"0".equals(searchModel.getCategoryId())) {
				sql += " and category_id = " + searchModel.getCategoryId();
			}
		

			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + 
						     " or p.detail_description like '%" + searchModel.getKeyword() + "%'" + 
						     " or p.short_description like '%" + searchModel.getKeyword() + "%')";
			}
		}
		
		return getEntitiesByNativeSQL(sql, searchModel.getCurrentPage());
	}
	
	public PagerData<Product> searchProductBySaleOrderId(Integer saleOrderId, ProductSearch searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p inner join tbl_saleorder_products sp on p.id = sp.product_id where saleorder_id = " + saleOrderId;

		if (searchModel != null) {
			
			// tìm kiếm theo category
			if(searchModel.getCategoryId() != null && !"0".equals(searchModel.getCategoryId())) {
				sql += " and category_id = " + searchModel.getCategoryId();
			}
		

			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (p.title like '%" + searchModel.getKeyword() + "%'" + 
						     " or p.detail_description like '%" + searchModel.getKeyword() + "%'" + 
						     " or p.short_description like '%" + searchModel.getKeyword() + "%')";
			}
		}
		
		return getEntitiesByNativeSQL(sql, searchModel.getCurrentPage());
	}
	public PagerData<Product> searchProductbyParentCategory(Integer parentcategoryId, ProductSearch searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p inner join tbl_category c on p.category_id= c.id  WHERE parent_id = " + parentcategoryId ;

		
		return getEntitiesByNativeSQL1(sql, searchModel.getCurrentPage());
	}
	public PagerData<Product> searchProductCategory(Integer parentcategoryId, Integer categoryId ,ProductSearch searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * From tbl_products p inner join tbl_category  c on p.category_id = c.id where p.category_id ="+ categoryId+ " and c.parent_id = " + parentcategoryId ;

		
		return getEntitiesByNativeSQL1(sql, searchModel.getCurrentPage());
	}
}
