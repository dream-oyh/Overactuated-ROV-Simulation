import numpy as np
import pandas as pd
from scipy.spatial.transform import Rotation as R

q = pd.read_csv("q.csv").to_numpy()
euler = R.from_quat(q).as_euler("xyz")

np.savetxt("euler.csv", euler,delimiter=',')
