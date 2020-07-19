library(CoExpNets)
library(CoExpROSMAP)
CoExpROSMAP::initDb()
library(WGCNA)
WGCNA::enableWGCNAThreads(4)

# Cargamos la base de datos disponible
expr.data = getExprDataFromTissue(tissue="notad",
                                  which.one="CoExpROSMAP")

# Seleccionamos una submuestra de tamaño 190
set.seed(12345)
exp.data2 <- expr.data[sample(nrow(expr.data),20),]

start.time1 <- Sys.time()
# Lanzamos el proceso de creación de la red bootstrap
set.seed(12345)
getBootstrapNetwork(mode = "bootstrap",expr.data = exp.data2, 
                    job.path = "results50/",
                    removeTOMF = TRUE, blockTOM = TRUE,
                    annotateFinalNet = TRUE,
                    b = 50)
end.time1 <- Sys.time()
end.time1 - start.time1