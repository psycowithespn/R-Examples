install.packages("rgl")
library(rgl)

# Colon.R from SEER
load("colon.R")

# Limit to 200 mm.
t2 = subset(colon, cssize < 200)
# Remove invalid survival values
t3 = subset(t2, surv < 9999)
# Open a window
open3d()
# Set the location of the corners
par3d(windowRect = c(5, 5, 1275, 750))
# Plot the 3D points
plot3d(t3$agedx,t3$surv, t3$cssize, col = as.numeric(factor(t3$stage)), type="p",
       xlab = "Age of Diagnosis", ylab = "Survival (Months)", zlab = "Tumor Size (MM)")
# Update the legend
legend3d("topright", legend = c("Stage 0", "Stage I", "Stage II", "Stage III", "Stage IV"),
         pch = 16, col = c(1:5), cex = 2)
