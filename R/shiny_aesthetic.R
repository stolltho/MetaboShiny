footer.css <- function(RGB.bg = "#ffc8c2", font.col="white"){
  base <- ".footer {position:fixed;
                    bottom:0;
                    width:100%;
                    height:40px;
                    z-index:1005;
                    color: white;
                    background-color:$RGB.bg;
                    border-style:solid; 
                    border-color:black;
                    border-width:1px; 
                    border-bottom: black;
                    border-left: black;
                    border-right: black;}
            .footer .btn {margin-top:2px; 
                          background-color:$RGB.bg; 
                          color:$font.col; 
                          border-style:none;}"
  no.na <- gsub(x = base, pattern = "\\n", replacement = "")
  filled <- gsubfn::fn$paste(no.na)
  # --- return ---
  filled
}

nav.bar.css <- function(RGB.bg = "#ffc8c2",
                        RGB.active.bg = "#e1897f",
                        RGB.col = "#ffffff",
                        RGB.active.col = "#ffffff"){

  base <- ".navbar { background-color: $RGB.bg !important;
  border: 0px !important;
  margin-bottom: 5px;}
  .nav > li[class=active] > a {
  background-color: $RGB.active.bg !important;
  color: $RGB.active.col !important; }
  .nav > li > a {
  background-color: $RGB.bg !important;
  color: $RGB.col !important;
  }
  .navbar:after{
      height:30px;
      width: 100%;
      background: -webkit-gradient(radial, 50% 0, 10, 50% 0, 40, from($RGB.bg), color-stop(0.49, $RGB.bg), color-stop(0.51, #fff), to(white));
    -webkit-background-size: 29px 100%;
  }"

  no.na <- gsub(x = base, pattern = "\\n", replacement = "")
  filled <- gsubfn::fn$paste(no.na)
  # --- return ---
  filled
}

app.font.css <- function(font.h1 = "Press Start 2P",
                        font.h2 = "Raleway bold",
                        font.h3 = "Raleway",
                        font.body = "Raleway serif",
                        size.h1 = 33,
                        size.h2 = 22,
                        size.h3 = 15,
                        size.body = 13,
                        font.col = "white",
                        online=T){

  print(online)
  
  size.h1 <- paste0(size.h1, "pt")
  size.h2 <- paste0(size.h2, "pt")
  size.h3 <- paste0(size.h3, "pt")
  size.body <- paste0(size.body, "pt")

  font.h1.w <- stringr::str_extract(font.h1, "(serif)|(bold)|(italic)")
  font.h2.w <- stringr::str_extract(font.h2, "(serif)|(bold)|(italic)")
  font.h3.w <- stringr::str_extract(font.h3, "(serif)|(bold)|(italic)")
  font.body.w <- stringr::str_extract(font.body, "(serif)|(bold)|(italic)")

  if(is.na(font.h1.w)) font.h1.w = ""
  if(is.na(font.h2.w)) font.h2.w = ""
  if(is.na(font.h3.w)) font.h3.w = ""
  if(is.na(font.body.w)) font.body.w = ""

  font.h1 <- gsub(font.h1, pattern = "( serif)|( bold)|( italic)", replacement = "")
  font.h2 <- gsub(font.h2, pattern = "( serif)|( bold)|( italic)", replacement = "")
  font.h3 <- gsub(font.h3, pattern = "( serif)|( bold)|( italic)", replacement = "")
  font.body <- gsub(font.body, pattern = "( serif)|( bold)|( italic)", replacement = "")

  fonts <- c(font.h1, font.h2, font.h3, font.body)

  font_weights <- list(font.h1.w,
                       font.h2.w,
                       font.h3.w,
                       font.body.w)

  names(font_weights) <- fonts

  font_joined <- sapply(unique(names(font_weights)), function(x) unname(unlist(font_weights[names(font_weights)==x])), simplify=FALSE)

  font.url <- sapply(1:length(font_joined), function(i){
    font.types <- font_joined[[i]]
    font.name <- names(font_joined)[[i]]
    font.name <- gsub(x = font.name, pattern=" ", replacement = "+")
    font.types <- font.types[font.types != ""]
    if(length(font.types) == 0){
      font.name
    }else{
      paste0(font.name, ":", paste0(font.types, collapse=","))
    }
  })

  font.url <- paste0(font.url, collapse = "|")

  font.h1.w = if(font.h1.w == "") "" else{paste0("font-weight: ", font.h1.w, ";")}
  font.h2.w = if(font.h2.w == "") "" else{paste0("font-weight: ", font.h2.w, ";")}
  font.h3.w = if(font.h3.w == "") "" else{paste0("font-weight: ", font.h3.w, ";")}
  font.body.w = if(font.body.w == "") "" else{paste0("font-weight: ", font.body.w, ";")}

  base.import <- if(online) gsubfn::fn$paste('@import url("https://fonts.googleapis.com/css?family=$font.url&display=swap");') else ""

  base <- '$base.import

  h1 {
  margin: 2px;
  font-family: "$font.h1";
  color: $font.col !important;
  $font.h1.w
  font-size: $size.h1;
  line-height: 0.5;
  margin-top: 8px;
  z-index:99998 !important;
  }

  h2 {
  margin: 1px;
  color: black;
  font-family: "$font.h2";
  $font.h2.w
  font-size: $size.h2;
  line-height: 1;
  }

  h3 {
  margin: 1px;
  color: black;
  font-family: "$font.h3";
  $font.h3.w
  font-size: $size.h3;
  line-height: 1;
  }

  body {
  color: black;
  font-family: "$font.body";
  $font.body.w
  font-size: $size.body;
  }'

  no.na <- gsub(x = base, pattern = "\\n", replacement = "")
  filled <- gsubfn::fn$paste(no.na)
  # -----
  filled
  }
