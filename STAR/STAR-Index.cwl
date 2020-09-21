#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: "quay.io/biocontainers/star:2.7.6a--0"
  SoftwareRequirement:
    packages:
      STAR:
        specs: [ "http://identifiers.org/biotools/star" ]
        version: [ "2.7.6a" ]

inputs:
   
  InputFiles:
    format: http://edamontology.org/format_1930
    type: File[]
    inputBinding:
      prefix: "--genomeFastaFiles"

  IndexName:
    type: string
    inputBinding:
      prefix: "--genomeDir"
      valueFrom: $("./" + self)

#Optional Inputs
  
  Gtf:
    type: File?
    inputBinding:
      prefix: "--sjdbGTFfile"

  Overhang:
    type: int?
    inputBinding:
      prefix: "--sjdbOverhang"
  
  Junctions:
    type: File?
    inputBinding:
      prefix: "--sjdbFileChrStartEnd"
  
  GenomeSize:
    type: int?
    inputBinding:
      prefix: "--genomeSAindexNbases"

  GenomeBits:
    type: int?
    inputBinding:
      prefix: "--genomeChrBinNbits"

baseCommand: [STAR]     

arguments:
  - valueFrom: "--runmode genomeGenerate"
    position: -1

outputs:
  indexes:
    type: Directory
    outputBinding:
      glob: $("./" + inputs.IndexName + "/")
