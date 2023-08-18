# Set up in R 

## On Noteable

1. Go to https://noteable.edina.ac.uk/login
2. Login with your EASE credentials
3. Select RStudio as a personal notebook server and press start
4. Go to File >New Project>Version Control>Git
5. Copy and Paste this repository URL https://github.com/DCS-training/PCA-2023 as the Repository URL
6. The Project directory name will filled in automatically but you can change it if you want your folder in Notable to have a different name
7. Decide where to locate the folder. By default, it will locate it in your home directory 
8. Press Create Project

Congratulations you have now pulled the content of the repository on your Notable server space the last thing you need to do is to install the packages not already installed in Noteable.

1. Open the 'Install.R' file and run the code within it 
2. Now you can open the 'PCA.R' file and you can follow along

## On your own machine

### R and RStudio

* R and RStudio are separate downloads and installations. R is the
underlying statistical computing environment, but using R alone is no
fun. RStudio is a graphical integrated development environment (IDE) that makes
using R much easier and more interactive. You need to install R before you
install RStudio. After installing both programs, you will need to install 
some specific R packages within RStudio. Follow the instructions below for
your operating system, and then follow the instructions to install
**`tidyverse`** and **`RSQLite`**.

#### Windows

> ## If you already have R and RStudio installed
>
> * Open RStudio, and click on "Help" > "Check for updates". If a new version is
> available, quit RStudio, and download the latest version for RStudio.
> * To check which version of R you are using, start RStudio and the first thing
>  that appears in the console indicates the version of R you are
>  running. Alternatively, you can type `sessionInfo()`, which will also display
>  which version of R you are running. Go on
>  the [CRAN website](https://cran.r-project.org/bin/windows/base/) and check
> whether a more recent version is available. If so, please download and install
> it. You can [check here](https://cran.r-project.org/bin/windows/base/rw-FAQ.html#How-do-I-UNinstall-R_003f) for
> more information on how to remove old versions from your system if you wish to do so.
{: .solution}

> ## If you don't have R and RStudio installed
>
> * Download R from
>  the [CRAN website](https://cran.r-project.org/bin/windows/base/release.htm).
> * Run the `.exe` file that was just downloaded
> * Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
> * Under *Installers* select **RStudio x.yy.zzz - Windows Vista/7/8/10** (where x, y, and z represent version numbers)
> * Double click the file to install it
> * Once it's installed, open RStudio to make sure it works and you don't get any
> error messages.
{: .solution}


#### macOS

> ## If you already have R and RStudio installed
>
> * Open RStudio, and click on "Help" > "Check for updates". If a new version is
>	available, quit RStudio, and download the latest version for RStudio.
>	* To check the version of R you are using, start RStudio and the first thing
>	  that appears on the terminal indicates the version of R you are running. Alternatively, you can type `sessionInfo()`, which will 
>	also display which version of R you are running. Go on
>	  the [CRAN website](https://cran.r-project.org/bin/macosx/) and check
>	  whether a more recent version is available. If so, please download and install
>	  it.
{: .solution}

> ## If you don't have R and RStudio installed
>
> * Download R from
>   the [CRAN website](https://cran.r-project.org/bin/macosx/).
> * Select the `.pkg` file for the latest R version
> * Double click on the downloaded file to install R
> * It is also a good idea to install [XQuartz](https://www.xquartz.org/) (needed
>   by some packages)
> * Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
> * Under *Installers* select **RStudio x.yy.zzz - Mac OS X 10.6+ (64-bit)**
>   (where x, y, and z represent version numbers)
> * Double click the file to install RStudio
> * Once it's installed, open RStudio to make sure it works and you don't get any
>   error messages.
{: .solution}

#### Linux

* Follow the instructions for your distribution
 from [CRAN](https://cloud.r-project.org/bin/linux), they provide information
 to get the most recent version of R for common distributions. For most
 distributions, you could use your package manager (e.g., for Debian/Ubuntu run
 `sudo apt-get install r-base`, and for Fedora `sudo yum install R`), but we
 don't recommend this approach as the versions provided by this are
 usually out of date. In any case, make sure you have at least R 3.5.1.
* Go to the [RStudio download
  page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select the version that matches your distribution, and
   install it with your preferred method (e.g., with Debian/Ubuntu `sudo dpkg -i
   rstudio-x.yy.zzz-amd64.deb` at the terminal).
* Once it's installed, open RStudio to make sure it works and you don't get any
   error messages.

### Organizing your working directory

Using a consistent folder structure across your projects will help keep things
organized, and will help you to find/file things in the future. This
can be especially helpful when you have multiple projects. In general, you may
create directories (folders) for **scripts**, **data**, and **documents**. 
If you want to learn more about how to get set have a look (https://datacarpentry.org/R-ecology-lesson/00-before-we-start.html)[https://datacarpentry.org/R-ecology-lesson/00-before-we-start.html]
