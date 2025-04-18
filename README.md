# Random Forest with Neutrosophic Logic for Student Performance Prediction

This repository contains the code for the paper **"Integrating Random Forest with Neutrosophic Logic for Predicting Student Academic Performance and Assessing Prediction Confidence"**. The study combines Random Forest regression with neutrosophic logic to predict student grades and quantify prediction confidence using truth (T), indeterminacy (I), and falsity (F) values.

## 📌 Paper Abstract
The study proposes a hybrid approach to predict students' final academic performance in mathematics by integrating Random Forest with neutrosophic logic. The model not only predicts grades but also assesses prediction reliability through neutrosophic components (T, I, F). The framework improves transparency in AI-assisted decision-making for educators and identifies at-risk students.

## Dataset
The model uses the `student-mat.csv` dataset containing:
- Demographic information
- Academic history
- Social and family attributes
- Final grades (G3) as target variable

Source: [Kaggle Student Performance Dataset](https://www.kaggle.com/datasets/mrigaankjaswal/student-performance-in-mathematics-and-portuguese)

## 📂 Repository Structure

student-mat.csv # Student performance dataset (mathematics)

student-mat-RandomForest-NeutrostatV2.R # R code for analysis

## Quick Start
1. **Clone the repository**:
   ```bash
   git clone https://github.com/fparrale/RandomForestAndNeutrosophy-MathematicsDataset.git
   cd RandomForestAndNeutrosophy-MathematicsDataset

## Key Results:
- Model Performance:
  - MAE: 1.54
  - RMSE: 3.02
  - R²: 0.61
- Neutrosophic Interpretation:
  - Predictions classified as confident (T=0.9), uncertain (I=0.4), or unreliable (F=0.5) based on error thresholds.

## Citation:
If you use this code or methodology, please cite the original paper:
@article{parrales2024integrating,
  title={Integrating Random Forest with Neutrosophic Logic for Predicting Student Academic Performance and Assessing Prediction Confidence},
  author={Parrales-Bravo, Franklin and Tolozano-Benites, Roberto and Castro-Mora, Alexander and Vasquez-Cevallos, Leonel and Cevallos-Torres, Lorenzo and Gomez-Rodriguez, Victor},
  journal={Neutrosophic Sets and Systems},
  year={2024}
}

## Contact:
For questions or collaborations, contact Franklin Parrales-Bravo (franklin.parrales@example.com).

## Note: 
The dataset student-mat.csv is sourced from Kaggle (https://www.kaggle.com/datasets/mrigaankjaswal/student-performance-in-mathematics-and-portuguese).
License: MIT (see LICENSE for details).
