install.packages("ggplot2")
library("ggplot2")

require("ggplot2")
require("RColorBrewer")

a=read.table("Host_short_term.txt", sep="\t", header=TRUE)
b=data.frame(Term=a$Term,p_value=(a$ppvalue),Count=a$Count)
c=data.frame(b[order(b[,2],decreasing=TRUE),])[1:20,]
d=data.frame(c[order(c[,2],decreasing=FALSE),])
sizeRange <- c(2,8)


p <- ggplot(data=d, aes(x=Term, y=p_value)) +
  geom_point(aes(color = p_value, size = Count))+
  theme(text = element_text(size = 100)) +
  theme(axis.text = element_text(size = 100))+
  scale_x_discrete(limits=factor(d[,1])) + 
  scale_color_gradientn(colours = c("blue", "red"), name="-log10(p_value)")+
  ggtitle("Host short term") + 
  ylab("-log10(p_value)") + 
  scale_size(range = sizeRange, name="Gene count")+
  theme_bw() + 
  coord_flip()
p