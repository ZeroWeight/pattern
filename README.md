# 一些随笔
- 在回归分析中,为什么连续变量之间就不能有交互项,分析没有意义  

> https://www.zybang.com/question/63def2cc55220f7a51b3b4cb1e04baec.html?ssl=1  


> 你可以想象一下,对于连续变量,应该会有很多个不同的数值,而每一个不同的数值就会被认为是一个分类,因此一个连续变量会被统计程序定义为有很多的分类.不难想象,两个连续变量进行交互分析时,会形成十分多的分类组合.在如此之多的分类组合之中,总会有一些分类组合由于偶然的原因而显示出显著性（这就是多重比较的问题）,而只要有一个分类组合具有显著性,就会导致统计程序认为这两个连续变量之间具有交互作用,而实际上并非如此.此外,由于两个连续变量之间可以形成十分多的分类组合,也很难解释交互作用的意义,也就没有实际使用意义.
