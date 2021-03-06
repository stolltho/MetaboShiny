# MetaboShiny
Welcome to the info page on MetaboShiny! We are currently on BioRXiv and the paper itself is somewhat of a guide to how to use the software. Additionally, a visual manual to all the possible actions within the app can be viewed below.
For example input files (positive and negative peaklists + metadata) please see the `examples` folder.

http://biorxiv.org/cgi/content/short/734236v1

# Installation
## Through Docker
1. Install Docker. If you are on Windows and not running 10 pro or enterprise (likely) please try the following tutorial:https://docs.docker.com/toolbox/toolbox_install_windows/
2. Run the following in a terminal: `docker pull jcwolthuis/metaboshiny`
3. Make a folder in your home folder, in terminal: `mkdir -p ~/MetaboShiny/{databases,saves/admin}`
3. Run the following on command line/terminal: `docker run -p 8080:8080 -v ~/MetaboShiny/:/root/MetaboShiny/:cached --rm -it jcwolthuis/metaboshiny:latest Rscript -e "MetaboShiny::start.metshi(inBrowser=F)"`

## Through R
1. Install an R version that at least is R 3.5, install [Java](https://www.java.com/en/download/) and JDK (https://www.oracle.com/technetwork/java/javase/downloads/jdk12-downloads-5295953.html, may require creating an Oracle account)
2. Copy the commands listed in the `inst/install.metshi.R` file on this repository and run them in R (terminal or Rstudio)
3. In R(studio), run: `library(MetaboShiny); start.metshi(inBrowser=T)`;
4. Your browser should open automatically for you and you're in! Otherwise browse to the "Listening on x.x.x.x" address noted in terminal in your browser.

# Manual

## Databases
![Database Tab](inst/www/database_panel_a.png?raw=true "Database tab")
## User file import
![File Import](inst/www/file_import.png?raw=true "File import")
## Data normalization
![Normalization](inst/www/normalization.png?raw=true "Normalization")
## Pre-matching all m/z (optional)
![Prematching](inst/www/prematching.png?raw=true "Prematching")
## Statistics panel / side bar
![Statistics panel start](inst/www/stats.png?raw=true "Statistics Panel Start")
### Dimension reduction / plot export
![Dimension reduction and plot export](inst/www/dimred_export.png?raw=true "Dimension reduction and plot export")
### Overview plots / search bar
![Volcano plot and search bar](inst/www/stats2.png?raw=true "Volcano plot and search bar")
### Per m/z analysis / formula prediction
![Per m/z analysis and prediction sidebar](inst/www/permz_predict.png?raw=true "Per m/z analysis and prediction sidebar")
### Machine learning
![Machine learning settings and metadata bar](inst/www/ml1.png?raw=true "Machine learning settings and metadata bar")
![Machine learning results](inst/www/ml2.png?raw=true "Machine learning results")
### Match isotope scoring and abstract searching
![Isoscoring and abstract searching](inst/www/isoscore_wordcloud.png?raw=true "Isoscoring and abstract searching")
### Plot customization
![Plot customization](inst/www/colorbar.png?raw=true "Plot customization")



Please report any issues and feedback on the Issues page here, along with suggestions! =)
