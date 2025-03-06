# Panopticum News, data preparation

## Introduction
The following collection of notebooks is part of the [Panopticum News Project](https://mlml.io/p/panopticum-news/) data analysis and preparation. For now, I use one year of NYT coverage as a sample, in a further iteration the notebooks will be (hopefully) adapted to crunch data coming from other news outlets. This means that the notebooks work for NYT data specifically. These data can be downloaded using the official [NYT API](https://developer.nytimes.com/apis) and are not included in this folder.

## Structure of the folder
    └── 📁data
        └── 📁categories
            └── categories-over-time.json
            └── network.json
        └── 📁places
            └── nyt-coverage-places.json
            └── nyt-sum-places.json
            └── top_keywords_by_location.json
    └── 📁notebooks
        └── 📁categories
            └── places-top-keywords.ipynb
            └── places.ipynb
            └── relational-categories.ipynb
            └── temporal-overview.ipynb
            └── unique_keywords.txt
        └── 📁images
            └── download.ipynb
            └── face-recognition.ipynb
            └── 📁utils
                └── face_detection_yunet_2023mar.onnx
        └── create-temp-data.ipynb
    └── README.md


The `src` folder contains the Jupyter Notebooks. The `data` folder contains the exported data.

### ./notebooks/create-temp-data.ipynb
Assuming the existance of a folder named `input-data` that contains separate `.json` files for each month of coverage, this notebook simply loads and concatenate all the files and exports a dataset called `temp-data.json` in the same folder. This data will be used within the notebooks to analyze the full coverage.

## Categories

### ./notebooks/categories/relational-categories.ipynb
The notebook can be used to prepare relational data about article categories. The idea is to treat each category as the node of a possible network and compute the overlap between all existing pairs between categories to use them as links. The approach is rather crude and will probably evolve over time. More details in the notebook. The resulting dataset is stored at `./data/network.json`.

### ./notebooks/categories/temporal-overview.ipynb
The notebook can be used to analyze the volume and freqency of coverage. It aggregates individual articles along categories, retaining information about the news outlet section to allow future filter operations. The resulting dataset is stored ar `./data/categories-over-time.json`.

## Images

### ./notebooks/images/download.ipynb
The notebook should be used to download the corpus of images for the analysis. It creates a subfolder in `data` called `images/nytimes` and saves the images there. By design, the images will not be committed in the GitHub repo. 

## Places

### ./notebooks/images/places.ipynb
The notebook can be used to find out how many times the NYT coverage references a place, by creating a list of countries and US states to test against the keywords used in articles. The notebook outputs the dataset `nyt_coverage_places` where all the categories related to a certain place are included, as well as the timeline of mentions for a certain country. 

### ./notebooks/images/places-top-keywords.ipynb
The notebook returns the file `top_keywords_by_location.json` where only the top 20 categories for each location are kept, along with the amount of times each category is mentioned in relation to the total count of articles.