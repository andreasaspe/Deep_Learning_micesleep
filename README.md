# Deep_Learning_micesleep

We have organised the code for both models in the folders called 'VAE' and 'mcRBM' respectively.

## Regarding VAE
Inside of the VAE-folder one can find the notebook containing the code fot the VAE. This file is called 'VAE.ipynb'. There is also a folder called 'preprocessed_data', which contains the data. If you download the notebook and the folder and keep the same folder structure, it should be plug and play to run the VAE (given that all the packages are installed. The default settings are 10 latent features and beta = 1.1. In rare occassions the network cannot train with 10 latent features, and in that case just run the notebook a few times more and you will definitely see it training. Also it is not every time the network finds the very best reconstruction leading to a very high ELBO - but again this often occurs, so consider running the notebook once more if you don't get it wihtin a reasonable amount of epochs the first time.

Inside of 'preprocessed_data' you can find .npz files which contains data. For the VAE we have used the data file called experiment1.npz. For more information about data see article https://journals.plos.org/plosbiology/article/file?id=10.1371/journal.pbio.2003663&type=printable. This article desrices the mcRBM that we have implemented, but we are using the same data for both models and hence information about the data can be found here.



## Regarding mcRBM
Inside the mcRBM-folder you will find the most important files for running this method. The model can be trained by running the bash-script 'run_gpu_v2.sh'. This will then call the trainModel.py file which again calls the function given in the file mcRBM.py. This last python-file contains the method itself.

NOTE - this is not our own code. It was written by other the authors of this article: https://journals.plos.org/plosbiology/article/file?id=10.1371/journal.pbio.2003663&type=printable. We have downloaded their source code as described and in order to actually run it and reproduce their results, you need exactly their structure and many more folders. However, the whole setp with source-code, data and figures are too big for Github in terms of memory. We have therefore put all the files that we used to run the method inside a google drive. You can find everything by clicking this link: https://drive.google.com/drive/folders/1QlkOb0de5ixQH-uYY_y6PsgJX7x_QFnp

We trained the model in the hpc-clusters, since we need to make use of CUDA to run on GPUs. To train the model, run the bash-script 'run_gpu_v2.sh' which you find inside of the folder 'trainModel'. Inside of this file you first need to change the directory in the variable BASE_DIR.
