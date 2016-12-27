/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function hideAdminNavbar(){
    
    var admin = document.getElementById("admin-nav");
    alert(admin.innerHTML);
    admin.style.display = "none";
    $("admin-nav").hide();
}

