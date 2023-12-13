<img align="right" src="https://github.com/wennj/plasmid-collapse-gene-loss-unicycler-galaxy/blob/main/pcglug_logo.png" width="128"/>  
  
# Galaxy workflow to avoid inter-plasmidic repeat collapse and false gene loss in Unicycler's hybrid assemblies

The workflow published here accompanied the publication by Schäfer et al. (submitted).  
The publication will be linked here as soon as it is published.

## Introduction
There are two main sequencing techniques commonly used to decipher bacterial genomes: Illumina and Nanopore sequencing. Both of these methods have distinct advantages that make them particularly suitable for bacterial genome analysis. Illumina sequencing, also known as short-read sequencing, utilizes a highly parallelized approach to generate millions of short DNA fragments in parallel. These fragments are then sequenced simultaneously, resulting in a massive amount of data at a relatively low cost. The advantages of Illumina sequencing include its high accuracy and cost-effectiveness, making it a popular choice for genome-wide surveys and large-scale studies. However, its short read lengths (typically 100-300 base pairs) can pose challenges when assembling complex regions of bacterial genomes. Nanopore sequencing, on the other hand, is a long-read sequencing technology that passes DNA strands through a tiny pore and measures changes in electrical current as individual bases pass through. This approach produces longer reads (thousands to tens of thousands of base pairs) and is particularly valuable for resolving repetitive regions, structural variations, and plasmids within bacterial genomes. Nanopore sequencing offers real-time data generation and can be performed in portable devices, enabling rapid and on-site analysis. To overcome the limitations of each individual technique, researchers often employ hybrid assembly strategies. In hybrid assembly, short-read data from Illumina sequencing is combined with long-read data from Nanopore sequencing. This approach leverages the accuracy of Illumina data for error correction and the long-read data's ability to span complex genomic regions, resulting in more complete and accurate bacterial genome assemblies.  
  
Illumina and Nanopore sequencing techniques offer complementary strengths for bacterial genome analysis, with Illumina providing high accuracy and cost-effectiveness and Nanopore offering long reads for resolving complex regions. Hybrid assembly combines these benefits to produce more complete and accurate genome assemblies. However, challenges like repetitive elements and genome complexity can still complicate the assembly process, requiring careful consideration and bioinformatic analysis to achieve reliable results.

## Galaxy bioinformatic platform
Galaxy provides a user-friendly, web-based interface for performing a wide range of bioinformatic analyses. It is particularly useful for beginners in bioinformatics and lowers the barriers to entry, enabling users to perform a wide range of analyses without requiring extensive programming skills or technical expertise.  

+ <b>User-Friendly Interface:</b> Galaxy offers an intuitive and graphical user interface (GUI) that doesn't require programming expertise. This makes it accessible to users who may not have a strong background in command-line bioinformatics.
+ <b>No Software Installation:</b> Users can access Galaxy through a web browser, eliminating the need to install and configure complex bioinformatics software packages on their local machines.
+ <b>Tool Integration:</b> Galaxy provides a vast library of bioinformatics tools and workflows that are pre-installed and readily available. Users can simply select the tools they need from a menu and connect them in a workflow to perform analyses.  
+ <b>Reproducibility:</b> Galaxy keeps a detailed history of all the analyses performed, making it easy for beginners to track and reproduce their work. This feature helps ensure the transparency and reproducibility of research.  
+ <b>Community and Resources:</b> Galaxy has a supportive user community and offers extensive documentation and tutorials, making it an excellent resource for beginners to learn bioinformatics concepts and techniques.  
+ <b>Workflows:</b> Galaxy's workflows feature allows users to string together a series of tools and analyses into a streamlined process. This makes it easier for beginners to follow a logical sequence of steps in their research, promoting good analytical practices.  

### Public Galaxy instances
There are a number of publicly available Galaxy instances that can be found via web search. Here are two examples:
+ https://usegalaxy.org/
+ https://nanopore.usegalaxy.eu/


## About this Galaxy workflow
The workflow of this repository established for deciphering bacterial genomes combines the strengths of two sequencing technologies, Illumina (short-read) and Nanopore (long-read). It is divided into three main sections:  
+ **Quality Control and Preprocessing:** In this initial phase, the quality and integrity of the sequencing data are ensured. Data is filtered and checked to meet quality standards.
+ **Short-Read Assembly:** Illumina reads are used to perform a short-read assembly. This step serves as an initial assessment of the genome's quality and completeness based on assembly graph analysis and BUSCO scores.
+ **Hybrid Assembly:** The final assembly is carried out by combining both Illumina and Nanopore data. The best SPAdes graph plays a pivotal role in this process. If the genome remains incompletely resolved, further adjustments are made using tools like bandage and BLAST searches. Manual correction of multiplicities may be needed to achieve a fully resolved genome.

This workflow aims to provide a comprehensive and accurate assembly of bacterial genomes, addressing challenges related to repetitive regions and ensuring the completeness of plasmid sequences. It emphasizes the importance of careful manual curation to overcome potential issues during the assembly process.

**Unicycler** is a key component of the provided Galaxy workflows and is responsible for the hybrid assembly of the sequenced bacterial genome. It integrates both short-read (Illumina) and long-read (Nanopore) sequencing data to reconstruct the whole bacterial genomes (chromosome and plasmids). Unicycler is used to create an initial assembly graph, but it can face challenges in resolving complex regions, especially large repetitive regions located on different plasmids, referred to as "inter-plasmidic repeats." While Unicycler is effective in resolving many repeats through the combination of short and long read data, it can encounter difficulties when dealing with inter-plasmidic repeats. In such cases, additional manual editing and curation are required to complete the genome assembly. Manual correction of contig multiplicities and adjustments to the assembly process are often necessary to prevent algorithmic collapses of repeat sequences and ensure the accuracy and completeness of the genomes.  

A detailed description of how to curate and adjust multiplicities is descriped in the publication of Schäfer et al. (submitted).

### Galaxy workflow files
There are two files available that are required to run the workflow. The files are in Galaxy workflow format and can be imported directly into Galaxy. Under the workflow tab the   

|File                                                               |Description            |
|-------------------------------------------------------------------|-----------------------|
|Galaxy-Workflow-plasmid-collapse-unicycler-galaxy-auto-hybrid.ga   |This is a brief description of what this file is doing.|
|Galaxy-Workflow-plasmid-collapse-unicycler-galaxy-hybrid-rerun.ga  |This is another brief description of what this file is doing dummy text.                       |

Once the files have been imported into Galaxy, they can be executed. However, it should be noted that the dependencies of the Galaxy instance used may not necessarily be fulfilled. It may therefore be advisable to create the workflow yourself under Galaxy. It may be necessary to ask the admin of the Galaxy instance  to install missing tools or carry out updates. A detailes description of how the workflows works and which tools are required are mentioned in the publication at the top of this page.

### Required tools

| Tool                                   | Purpose                                       |
|----------------------------------------|-----------------------------------------------|
| Concatenate dataset tail-to-head (cat) | Adding raw read files together                |
| FastQC                                 | Quality control (short read)                  |
| NanoStat                               | Quality control (long read)                   |
| Trim Galore!                           | Read quality filter and trimming (short read) |
| NanoFilt                               | Read quality filter and trimming (long read)  |
| Unicycler                              | Assembly                                      |
| BUSCO                                  | Evaluation                                    |
| Compute sequence length                | Evaluation                                    |
| BWA-MEM                                | Evaluation                                    |
| Samtools stats                         | Evaluation                                    |
