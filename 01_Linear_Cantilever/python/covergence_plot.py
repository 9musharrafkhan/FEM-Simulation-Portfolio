import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv("../data/convergence_plot.csv")

plt.plot(data["element_size"],
         data["displacement"],
         marker='o')

plt.xlabel("Element Size (mm)")
plt.ylabel("Tip Deflection (mm)")
plt.title("Mesh Convergence Study")

plt.grid(True)

plt.savefig("../results/convergence_plot.png")
plt.show()
