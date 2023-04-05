function changeImage(id) {
    var srcImg ="images/"+ id +".jpg";
    console.log(srcImg);
    document.getElementById("show-img").setAttribute("src", srcImg);
    document.getElementById("slide-1").classList.remove("red");
    document.getElementById("slide-1").removeAttribute("style");
    document.getElementById("slide-2").removeAttribute("style");
    document.getElementById("slide-3").removeAttribute("style");
    document.getElementById("slide-4").removeAttribute("style");
    document.getElementById("slide-5").removeAttribute("style");
    document.getElementById("slide-6").removeAttribute("style");
    document.getElementById("slide-7").removeAttribute("style");
    
    document.getElementById(id).setAttribute("style", "background:#FA8072");
}

const a = document.querySelector.bind(document);
const aa = document.querySelectorAll.bind(document);

const tabs = aa(".tab-item");
const panes = aa(".tab-pane");

tabs.forEach((tab, index) => {
    const pane = panes[index];
    tab.onclick = function() {
        a(".tab-item.active").classList.remove("active");
        a(".tab-pane.active").classList.remove("active");
        this.classList.add("active");
        pane.classList.add("active");
    }
})

const tabs1 = aa(".tab-item1");
const panes1 = aa(".tab-pane1");

tabs1.forEach((tab, index) => {
    const pane1 = panes1[index];
    tab.onclick = function() {
        a(".tab-item1.active").classList.remove("active");
        a(".tab-pane1.active").classList.remove("active");
        this.classList.add("active");
        pane1.classList.add("active");
    }
})

const tabs2 = aa(".tab-item2");
const panes2 = aa(".tab-pane2");

tabs2.forEach((tab, index) => {
    const pane2 = panes2[index];
    tab.onclick = function() {
        a(".tab-item2.active").classList.remove("active");
        a(".tab-pane2.active").classList.remove("active");
        this.classList.add("active");
        pane2.classList.add("active");
    }
})

