# EVCS:Extended Visual Cryptography System (MATLAB Implementation)

## Overview
This repository contains the MATLAB implementation of our research on Neural-Enhanced Visual Cryptography: A Framework for Embedding Secrets with High Fidelity. The project explores the integration of neural networks with visual cryptography to enhance the quality and robustness of secret image embedding. Our approach improves fidelity while maintaining security, making it suitable for secure image transmission and storage.

##  Key Features
Neural-Enhanced Visual Cryptography for improved image fidelity and security.
Deep Learning Integration to optimize share generation and reconstruction.
MATLAB-Based Implementation with high-level synthesis and experimental analysis.
Robust Image Encoding ensuring secure and high-quality secret embedding.
Optimized Performance for real-time execution and minimal information loss.

---
##  Comprehensive Usage Guide

### **Installation & Setup**
Follow these steps to set up and run the code:

1. **Install MATLAB** (R2021a or later recommended).
2. **Ensure Required Toolboxes are Installed** (see Dependencies & Requirements below).
3. **Clone the Repository:**
   ```sh
   git clone https://github.com/IdachristyJulious/EVCS.git
   cd EVCS
   ```
4. **Open MATLAB and Set the Path:**
   - Open MATLAB.
   - Navigate to the repository folder.
   - Run `startup.m` to initialize dependencies.

### **Running the Code**
Execute the main script in MATLAB:
```matlab
run('EVCmain.m')
```
This will process the input images using visual cryptography and display the results.

### **Input Format**
- The input should be RGB images in `.png` or `.jpg` format.
- Images should be placed in the `input_images/` directory.

### **Interpreting Output**
- The processed images and cryptographic shares will be saved in the `output/` directory.
- The visual cryptography scheme will generate two shares that can be combined to reconstruct the original image.

---
##  Dependencies & Requirements
Ensure the following MATLAB toolboxes and libraries are installed:

- **Image Processing Toolbox**
- **Computer Vision Toolbox**
- **Signal Processing Toolbox**
- MATLAB version **R2021a or later**

Install missing toolboxes using:
```matlab
matlab.addons.install('ToolboxName')
```

---
## Key Algorithm Descriptions
### **Algorithm Overview**
The system implements a **Visual Cryptography Scheme (VCS)** with enhancements for secure medical image sharing. The key steps include:

1. **Preprocessing:** Convert images to Halftone Images.
2. **Share Generation:** Split images into multiple shares using a matrix-based cryptographic approach.
3. **High-Level Synthesis:** Optimize the algorithm for performance efficiency.
4. **Reconstruction:** Combine the shares to retrieve the original image.

### **Mathematical Model**
The scheme follows a probabilistic model where each pixel in the original image is divided across multiple shares, ensuring that no single share reveals information.

---
##  Experimental Reproducibility
### **Example Datasets**
We provide sample input images in the `input_images/` folder for easy replication.

### **Replication Steps**
1. Download the dataset or use your own images.
2. Run `EVCmain.m` to generate cryptographic shares.
3. Compare the reconstructed images with the original images.
4. Evaluate performance metrics like **PSNR (Peak Signal-to-Noise Ratio)** and execution time.

---
## Permanent Links & Citation Format
### **GitHub Repository**
[EVCS GitHub Repository](https://github.com/IdachristyJulious/EVCS)

### **Citation Format**
If you use this work, please cite it as follows:

Neural-Enhanced Visual Cryptography: A Framework for Embedding Secrets with High Fidelity
Published in The Visual Computer
Authors: Ida Christy Julious, D Abisha, R. Navedha Evangelin

Ensure to include this citation in any derivative work or publication.

---
##  Contact & Contributions
For any issues, feel free to open an issue in the repository or contact the authors.

Contributions are welcome! Fork the repository and submit a pull request with your enhancements.

📧 **Email:** christy@nec.edu.in 
