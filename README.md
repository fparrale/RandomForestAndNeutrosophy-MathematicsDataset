# Random Forest with Neutrosophic Logic for Student Performance Prediction

This repository contains the code for the paper **"Integrating Random Forest with Neutrosophic Logic for Predicting Student Academic Performance and Assessing Prediction Confidence"**. The study combines Random Forest regression with neutrosophic logic to predict student grades and quantify prediction confidence using truth (T), indeterminacy (I), and falsity (F) values.

## 📌 Paper Abstract
The study proposes a hybrid approach to predict students' final academic performance in mathematics by integrating Random Forest with neutrosophic logic. The model not only predicts grades but also assesses prediction reliability through neutrosophic components (T, I, F). The framework improves transparency in AI-assisted decision-making for educators and identifies at-risk students.

## 📊 Dataset

The model uses the `student-mat.csv` dataset containing:
- Demographic information
- Academic history
- Social and family attributes
- Final grades (G3) as target variable

The dataset used is publicly available:

- 📥 [Kaggle Dataset](https://www.kaggle.com/datasets/mrigaankjaswal/student-performance-in-mathematics-and-portuguese)
- 📥 [UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/320/student+performance)

This project uses **only the `student-mat.csv`** file (mathematics performance).

---

## 🛠 Features

- Preprocessing of student data (categorical conversion, train-test split)
- Random Forest model with 100 trees to predict final grade `G3`
- Evaluation metrics:
  - Mean Absolute Error (MAE)
  - Root Mean Squared Error (RMSE)
  - Coefficient of Determination (R²)
- Neutrosophic interpretation of prediction reliability:
  - T: Truth
  - I: Indeterminacy
  - F: Falsity
- Visualization of:
  - Actual vs Predicted Grades
  - Predictions colored/sized by indeterminacy
  - Neutrosophic interpretation of prediction error

---


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

---

## 🚀 How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/fparrale/RandomForestAndNeutrosophy-MathematicsDataset.git
   cd RandomForestAndNeutrosophy-MathematicsDataset
   ```

2. Open the R script and execute in your preferred R environment (e.g., RStudio).

3. The main steps in the script include:
   - Loading and preprocessing the data
   - Training the Random Forest model
   - Calculating prediction errors
   - Assigning neutrosophic values based on error thresholds
   - Visualizing predictions and uncertainties

---

## 📈 Example Outputs

- `Figure 2`: Scatter plot of predicted vs. actual grades  
- `Figure 3`: Scatter plot with indeterminacy (I) as size/color  
- `Figure 4`: Neutrosophic interpretation of prediction errors (T, I, F)

---

## 📚 Citation

If you use this work, please cite the associated publication:

```
Parrales-Bravo, F. et al. (2025). Integrating Random Forest with Neutrosophic Logic for Predicting Student Academic Performance and Assessing Prediction Confidence. Neutrosophic Sets and Systems, Vol. xx.
```

---

## 🤝 Acknowledgments

- This work was supported by **Universidad de Guayaquil**, under project FCI-021-2024.
- Special thanks to the UCI and Kaggle datasets.

---

## Contact:
For questions or collaborations, contact Franklin Parrales-Bravo.

