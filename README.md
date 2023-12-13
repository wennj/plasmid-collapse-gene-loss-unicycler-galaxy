# Galaxy workflow to avoid inter-plasmidic repeat collapse and false gene loss in Unicycler's hybrid assemblies

The workflow published here accompanied the publication by Schäfer et al. (submitted).  
The publication will be linked here as soon as it is published.

## Introduction
There are two main sequencing techniques commonly used to decipher bacterial genomes: Illumina and Nanopore sequencing. Both of these methods have distinct advantages that make them particularly suitable for bacterial genome analysis. Illumina sequencing, also known as short-read sequencing, utilizes a highly parallelized approach to generate millions of short DNA fragments in parallel. These fragments are then sequenced simultaneously, resulting in a massive amount of data at a relatively low cost. The advantages of Illumina sequencing include its high accuracy and cost-effectiveness, making it a popular choice for genome-wide surveys and large-scale studies. However, its short read lengths (typically 100-300 base pairs) can pose challenges when assembling complex regions of bacterial genomes. Nanopore sequencing, on the other hand, is a long-read sequencing technology that passes DNA strands through a tiny pore and measures changes in electrical current as individual bases pass through. This approach produces longer reads (thousands to tens of thousands of base pairs) and is particularly valuable for resolving repetitive regions, structural variations, and plasmids within bacterial genomes. Nanopore sequencing offers real-time data generation and can be performed in portable devices, enabling rapid and on-site analysis. To overcome the limitations of each individual technique, researchers often employ hybrid assembly strategies. In hybrid assembly, short-read data from Illumina sequencing is combined with long-read data from Nanopore sequencing. This approach leverages the accuracy of Illumina data for error correction and the long-read data's ability to span complex genomic regions, resulting in more complete and accurate bacterial genome assemblies.  
  
Illumina and Nanopore sequencing techniques offer complementary strengths for bacterial genome analysis, with Illumina providing high accuracy and cost-effectiveness and Nanopore offering long reads for resolving complex regions. Hybrid assembly combines these benefits to produce more complete and accurate genome assemblies. However, challenges like repetitive elements and genome complexity can still complicate the assembly process, requiring careful consideration and bioinformatic analysis to achieve reliable results.

## Galaxy bioinformatic platform
Galaxy is a bioinformatics platform that provides a user-friendly, web-based interface for performing a wide range of bioinformatic analyses. It is particularly useful for beginners in bioinformatics and lowers the barriers to entry, enabling users to perform a wide range of analyses without requiring extensive programming skills or technical expertise.  

+ <b>User-Friendly Interface:</b> Galaxy offers an intuitive and graphical user interface (GUI) that doesn't require programming expertise. This makes it accessible to users who may not have a strong background in command-line bioinformatics.
+ <b>No Software Installation:</b> Users can access Galaxy through a web browser, eliminating the need to install and configure complex bioinformatics software packages on their local machines.
+ <b>Tool Integration:</b> Galaxy provides a vast library of bioinformatics tools and workflows that are pre-installed and readily available. Users can simply select the tools they need from a menu and connect them in a workflow to perform analyses.  
+ <b>Reproducibility:</b> Galaxy keeps a detailed history of all the analyses performed, making it easy for beginners to track and reproduce their work. This feature helps ensure the transparency and reproducibility of research.  
+ <b>Community and Resources:</b> Galaxy has a supportive user community and offers extensive documentation and tutorials, making it an excellent resource for beginners to learn bioinformatics concepts and techniques.  
+ <b>Workflows:</b> Galaxy's workflows feature allows users to string together a series of tools and analyses into a streamlined process. This makes it easier for beginners to follow a logical sequence of steps in their research, promoting good analytical practices.  
  
## About the Workflow
Der hier präsentierte Workflow führt ein Hybrid-Assembly zur Rekonstruktion von bakteriellen 

![alt text](https://github.com/wennj/plasmid-collapse-gene-loss-unicylcer-galaxy/main/?raw=true)
