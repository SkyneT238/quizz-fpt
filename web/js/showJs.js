function toggleHeaderInfo() {
  var headerInfo = document.getElementById("header-info");
  var arrow = document.getElementById("showmore-arrow");

  if (headerInfo.style.display === "none") {
    // Header info is currently hidden, so show it
    headerInfo.style.display = "block";
    arrow.classList.add("rotate");
  } else {
    // Header info is currently visible, so hide it
    headerInfo.style.display = "none";
    arrow.classList.remove("rotate");
  }
}


