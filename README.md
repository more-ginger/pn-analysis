# Panopticum News, data preparation

## Introduction
The following collection of notebooks is part of the [Panopticum News Project](https://mlml.io/p/panopticum-news/) data analysis and preparation. For now, I use one year of NYT coverage as a sample, in a further iteration the notebooks will be (hopefully) adapted to crunch data coming from other news outlets. This means that the notebooks work for NYT data specifically. These data can be downloaded using the official [NYT API](https://developer.nytimes.com/apis) and are not included in this folder.

## Structure of the folder
    └── 📁data
        └── categories-over-time.json
        └── network.json
    └── 📁src
        └── create-temp-data.ipynb
        └── relational-categories.ipynb
        └── temporal-overview.ipynb
    └── README.md


The `src` folder contains the Jupyter Notebooks. The `data` folder contains the exported data.

### ./src/create-temp-data.ipynb
Assuming the existance of a folder named `input-data` that contains separate `.json` files for each month of coverage, this notebook simply loads and concatenate all the files and exports a dataset called `temp-data.json` in the same folder. This data will be used within the notebooks to analyze the full coverage.

### ./src/relational-categories.ipynb
The notebook can be used to prepare relational data about article categories. The idea is to treat each category as the node of a possible network and compute the overlap between all existing pairs between categories to use them as links. The approach is rather crude and will probably evolve over time. More details in the notebook. The resulting dataset is stored at `./data/network.json`.

### ./src/temporal-overview.ipynb
The notebook can be used to analyze the volume and freqency of coverage. It aggregates individual articles along categories, retaining information about the news outlet section to allow future filter operations. The resulting dataset is stored ar `./data/categories-over-time.json`.