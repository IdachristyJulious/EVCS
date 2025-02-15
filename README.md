Neural-Enhanced Visual Cryptography: A Framework for Embedding Secrets with High Fidelity

Overview

The EVCS (Embedding Secrets with Style) project is a MATLAB-based framework that leverages neural networks to enhance the fidelity of visual cryptography techniques. This approach aims to improve the quality of extended visual cryptography (EVC) by employing various neural network models such as feedforward networks, ARTMAP, and self-organizing maps.

Features

Implementation of Extended Visual Cryptography (EVC) with high-fidelity secret embedding

Neural network-based enhancements to improve image quality

Comparison of different neural models using PSNR and time complexity metrics

Robust to noise introduction

MATLAB-based implementation for efficient computation

Prerequisites

To run this project, ensure you have the following installed:

MATLAB (R2020a or later recommended)

Image Processing Toolbox (for image operations)

Deep Learning Toolbox (for neural network-based methods)

Usage Guidelines

Running the Code

Prepare Input Images

Ensure that you have grayscale or binary images ready for encryption.

Place them in the input_images folder.

Run the Main Script

Execute the main MATLAB script:

run_evcs.m

This script will process the input images, apply the neural network models, and generate encrypted shares.

Modify Parameters (Optional)

Change the neural network model by modifying network_model in run_evcs.m.

Adjust encryption settings in config.m.

View Results

The encrypted shares and reconstructed images will be saved in the output_images folder.

PSNR and time complexity metrics will be displayed in the command window.

Example

inputImage = imread('input_images/sample.png');
shares = generate_shares(inputImage);
reconstructedImage = reconstruct_image(shares);
imshow(reconstructedImage);

Dataset and Open Source Code

The dataset and source code are openly available in this repository. To enhance transparency and reproducibility, please cite the DOI when referencing this work.

Citation

If you use this project in your research, please cite it as:

@article{EVCS2025,
  author = {Idachristy Julious et al.},
  title = {Neural-Enhanced Visual Cryptography: A Framework for Embedding Secrets with High Fidelity},
  journal = {The Visual Computer},
  year = {2025},
  publisher = {Springer}
}
