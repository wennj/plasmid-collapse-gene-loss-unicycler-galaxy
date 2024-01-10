<img align="right" src="https://github.com/wennj/plasmid-collapse-gene-loss-unicycler-galaxy/blob/main/pcglug_logo.png" width="128"/>  
  
# Galaxy workflow to avoid inter-plasmidic repeat collapse and false gene loss in Unicycler's hybrid assemblies

*The workflow published here accompanies the publication by Schäfer et al. (2024).*  
[Link to publication in *Microbial Genomics*](https://www.microbiologyresearch.org/content/journal/mgen/10.1099/mgen.0.001173?utm_campaign=shareaholic&utm_medium=copy_link&utm_source=bookmark)

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

### Unicycler 

[Unicycler](https://github.com/rrwick/Unicycler) is one of the tools that has been incorporated into  Galaxy ecosystems and key component of the provided Galaxy workflows. It is responsible for the hybrid assembly of the sequenced bacterial genome. It integrates both short-read (Illumina) and long-read (Nanopore) sequencing data to reconstruct the whole bacterial genomes (chromosome and plasmids). Unicycler is used to create an initial assembly graph, but it can face challenges in resolving complex regions, especially large repetitive regions located on different plasmids, referred to as "inter-plasmidic repeats." While Unicycler is effective in resolving many repeats through the combination of short and long read data, it can encounter difficulties when dealing with inter-plasmidic repeats. In such cases, additional manual editing and curation are required to complete the genome assembly. Manual correction of contig multiplicities and adjustments to the assembly process are often necessary to prevent algorithmic collapses of repeat sequences and ensure the accuracy and completeness of the genomes.  

To use Unicycler in Galaxy, you would typically import or select the Unicycler tool from the Galaxy toolshed, configure the tool parameters, and then execute your genome assembly analysis as part of your Galaxy workflow. This integration enhances the flexibility and convenience of Unicycler for users who prefer working within the Galaxy environment for their bioinformatics analyses. So far, it is not possible to start a re-run with the Galaxy integration that uses a modified SPAdes graph. However, work is in progress to enable this integration: https://github.com/galaxyproject/tools-iuc/pull/5656


A detailed description of how to curate and adjust multiplicities using Unicycler and SPAdes Graph is descriped in the publication of Schäfer et al. (submitted).

### Manual SPAdes Graph modification

A [SPAdes](https://github.com/ablab/spades) graph is a visual representation generated by the SPAdes software (St. Petersburg Genome Assembler). It serves as a pivotal component in the genome assembly process, aiding in the organization and manipulation of sequence data derived from DNA sequencing experiments for the ultimate purpose of reconstructing an organism's genome. Unicycler, a bioinformatics tool, leverages the SPAdes graph by initially collecting raw DNA sequence data from various sequencing methodologies, including short-read data from platforms like Illumina and long-read data from Nanopore sequencing. Using the SPAdes software, Unicycler creates a graphical representation known as the SPAdes graph, which visually depicts how individual DNA sequences may interconnect and fit together, offering a blueprint for genome assembly. Unicycler meticulously scrutinizes the SPAdes graph, deciphering the relationships and connections between the sequences. This analysis helps pinpoint potential challenges within the genome assembly process, such as regions with repetitive DNA sequences or unresolved links between sequences. In instances where the SPAdes graph reveals specific hurdles in genome assembly, Unicycler may require manual intervention. This intervention could involve adding supplementary information to resolve repetitive sequences or rectifying any inaccuracies or gaps in the graph. Following a thorough analysis of the SPAdes graph and the resolution of any identified issues, Unicycler utilizes the information derived from the graph to construct the final genome of the organism. This final genome serves as a comprehensive representation of the organism's DNA sequence and is instrumental for subsequent research and analysis purposes.  



### Galaxy workflow files
There are two files available that are required to run the workflow. The files are in Galaxy workflow format and can be imported directly into Galaxy. Under the workflow tab the   

|File                                                               |Description            |
|-------------------------------------------------------------------|-----------------------|
|Galaxy-Workflow-plasmid-collapse-unicycler-galaxy-auto-hybrid.ga   |This workflow comprises all steps (Read preprocessing, initial short read assembly and hybrid assembly) for a first intital run of the entire workflow. Basically it runs automatically all steps described in Figure 1 (Schäfer et al., submitted) except where manual curation is required.|
|Galaxy-Workflow-plasmid-collapse-unicycler-galaxy-hybrid-rerun.ga  |This workflow focusses on the third step (hybrid assembly) only allows the recursive run on the hybrid assembly after changing multiplicities within the SPAdes graph.|

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

## Import workflow file(s) into Galaxy

**Step 1 - Access Galaxy:** Start by accessing the Galaxy platform through your web browser. You can use a public Galaxy server or your own instance. Log in to your Galaxy account if you have one, or create a new account if necessary. Some public servers may allow guest access without registration.  

**Step 3 - Navigate to the Workflow Page:** Once logged in, you should see the Galaxy interface. Look for a "Workflow" or "Workflows" tab in the menu on the left or top side of the screen and click on it.  

**Step 3 - Download the workflow files:** Download the two Galaxy workflow files *Galaxy-Workflow-plasmid-collapse-unicycler-galaxy-auto-hybrid.ga* and *Galaxy-Workflow-plasmid-collapse-unicycler-galaxy-hybrid-rerun.ga* and save them on your computer.  

**Step 4 - Upload a Workflow File:** You can upload the workflow files directly to Galaxy. Click on "Upload or import" and then choose "Workflow file." Click the "Choose File" button to locate the workflow file on your computer. Once selected, click "Upload."  

**Step 5 - Review and Run the Workflow:** After importing the workflow, you'll see it listed in your workflows page. Click on the workflow's name to open it and review its details. Carefully review the workflow steps and any parameters that may need to be configured. Ensure that you understand the workflow's purpose and requirements. If everything looks correct, you can execute the workflow by clicking the "Run workflow" button.  

**Step 6 - Provide Input Data:** The workflow may require input datasets or parameters. Follow the prompts to provide the necessary input data, such as sequencing files or reference genomes.  

**Step 7 - Execute the Workflow:** Once you've provided the required inputs, click the "Run Workflow" or similar button to execute the workflow. Galaxy will automatically run each step in the workflow.  

**Step 8 - Review Outputs:** After the workflow completes, you can review the generated outputs and visualizations. Galaxy keeps a record of the entire analysis, ensuring transparency.  
  
That's it! You've successfully imported a workflow into Galaxy and executed it.

