import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.datasets import load_iris

sns.set(style="whitegrid")

# 1. Load the Dataset
try:
    iris = load_iris(as_frame=True)
    df = iris.frame
    print("Iris dataset loaded successfully.")
except Exception as e:
    print(f"Error loading dataset: {e}")

# 2. Data Exploration
print(df.head())
print(df.dtypes)
print(df.isnull().sum())

# 3. Data Cleaning (if needed)
# No missing values in this dataset.

# 4. Basic Data Analysis
print(df.describe())
df['species'] = df['target'].map(dict(enumerate(iris.target_names)))
print(df.groupby('species').mean(numeric_only=True))

# 5. Data Visualization

# Line chart (simulate time trend)
print("No time-series column in Iris dataset; plotting index as time.")
df['index'] = df.index
plt.figure(figsize=(10, 5))
plt.plot(df['index'], df['sepal length (cm)'], label='Sepal Length')
plt.plot(df['index'], df['petal length (cm)'], label='Petal Length')
plt.xlabel('Sample Index (as Time)')
plt.ylabel('Length (cm)')
plt.title('Line Chart: Sepal and Petal Length over Samples')
plt.legend()
plt.tight_layout()
plt.show()

# Bar chart: Average petal length per species
plt.figure(figsize=(7,5))
sns.barplot(x='species', y='petal length (cm)', data=df, ci=None, palette='Set2')
plt.title('Average Petal Length per Species')
plt.xlabel('Species')
plt.ylabel('Average Petal Length (cm)')
plt.tight_layout()
plt.show()

# Histogram: Sepal width distribution
plt.figure(figsize=(7,5))
sns.histplot(df['sepal width (cm)'], bins=15, kde=True, color='skyblue')
plt.title('Histogram: Sepal Width Distribution')
plt.xlabel('Sepal Width (cm)')
plt.ylabel('Frequency')
plt.tight_layout()
plt.show()

# Scatter plot: Sepal length vs Petal length by species
plt.figure(figsize=(8,6))
sns.scatterplot(x='sepal length (cm)', y='petal length (cm)', hue='species', data=df, palette='Set1')
plt.title('Sepal Length vs Petal Length by Species')
plt.xlabel('Sepal Length (cm)')
plt.ylabel('Petal Length (cm)')
plt.legend(title='Species')
plt.tight_layout()
plt.show()
