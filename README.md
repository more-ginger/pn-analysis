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
            └── keywords_places.ipynb
            └── keywords-structure.ipynb
            └── places-analysis.ipynb
            └── places-countries-kws.ipynb
            └── places.ipynb
        └── 📁images
            └── prepare-img-download.ipynb
            └── face-recognition.ipynb
            └── get-images.sh
            └── 📁assets
        └── 📁other  
            └── temporal-overview.ipynb
        └── create-temp-data.ipynb
    └── README.md


The `src` folder contains the Jupyter Notebooks. The `data` folder contains the exported data.

### ./notebooks/create-temp-data.ipynb
Assuming the existance of a folder named `input-data` that contains separate `.json` files for each month of coverage, this notebook simply loads and concatenate all the files and exports a dataset called `temp-data.json` in the same folder. This data will be used within the notebooks to analyze the full coverage.

## Categories

### ./notebooks/categories/keywords_places.ipynb
**!Work in progress** The notebook proposes a way to select groups of topics starting from common keywords.

### ./notebooks/categories/keywords-structure.ipynb
**!Work in progress** Using the NYT categorization system, the notebook looks in all possible combination of keywords.

### ./notebooks/categories/places-analysis.ipynb
Calculates the delta of coverage for each country, based on the comparison between Zeit and NYT data. Then, it extracts all keywords related to places and create a dictionary "keyword": "value, where value is the amount of times a specific keyword appears for each country.

### ./notebooks/categories/places-countries-kws.ipynb
Extracts the top mentioned countries for both newspapers, then goes one level down and explores the use of keywords related to those countries.

### ./notebooks/categories/places.ipynb
Finds and merges together all instances of places for NYT and Zeit data.

## Images

### ./notebooks/images/prepare-img-download.ipynb
The notebook should be used to prepare the csv file to download images. It creates a csv called `nyt_image_urls.csv` in the `input_data` folder, where only two columns are retained: `clean_id` (used for consistent naming) and `image_url` (used to download the image).

### ./notebooks/images/get-images.sh
The script can be run in the terminal and downloads all images contained in the `nyt_image_urls.csv`.
Make it executable:
``` chmod +x get-images.sh ```
Run:
``` bash get-images.sh ../../input-data/nyt-image-urls.csv ```

### ./notebooks/images/face-recognition.ipynb
The notebook introduces a top-down technique for face recognition. Currently work in progress.

## Other

### ./notebooks/categories/temporal-overview.ipynb
The notebook can be used to analyze the volume and freqency of coverage. It aggregates individual articles along categories, retaining information about the news outlet section to allow future filter operations. The resulting dataset is stored ar `./data/categories-over-time.json`.