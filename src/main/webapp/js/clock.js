function showtime() {
    const d=new Date();

    let today="";
    
    //년도
    today += d.getFullYear() + ".";

    //월
    if ((d.getMonth())+1<10) {
        today += "0" + (d.getMonth() + 1) + ".";
    } else {
        today += (d.getMonth() + 1) + ".";
    }

    //일
    today += d.getDate() + " ";            

    //요일
    switch(d.getDay()){
        case 0 : today+=" (일) "; break;
        case 1 : today+=" (월) "; break;
        case 2 : today+=" (화) "; break;
        case 3 : today+=" (수) "; break;
        case 4 : today+=" (목) "; break;
        case 5 : today+=" (금) "; break;
        case 6 : today+=" (토) "; break;                
    }
    //시간
    if ((d.getHours())>12) {
        today += "PM " +
        
        (d.getHours() - 12) + ":";
    } else if ((d.getHours())==12) {
        today += "PM " + (d.getHours()) + ":";
    } else {
        today += "AM " + (d.getHours()) + ":";
    }

    //분
    today += ("0" + d.getMinutes()).slice(-2) + ":";
    
    //초
    if ((d.getSeconds())<10) {
        today += "0" + d.getSeconds();
    } else {
        today += d.getSeconds();
    }

    document.getElementById("clock").innerHTML=today;

    timer=setTimeout(showtime, 1000);
} //showtime end

let timer; // 전역변수

function killtime () {
    clearTimeout(timer);
}