#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

doc: |
  Convert reads in BED format to BAM.

requirements:
  InlineJavascriptRequirement: {}
hints:
  ResourceRequirement:
    coresMin: 1
    ramMin: 15000
  DockerRequirement:
    dockerPull: truwl/bedtools:v2.27.1dfsg-4-deb_cv1
  SoftwareRequirement:
    packages:
      bedtools:
        specs: [ "http://identifiers.org/biotools/bedtools" ]
        version: [ "2.27.1" ]
  
baseCommand: ["bedtools", "bedtobam"]
stdout: $(inputs.bed.nameroot).bam      

inputs:
  bed:
    type: File
    inputBinding:
      position: 1
      prefix: "-i"
  reference_info:
    type: File
    inputBinding:
      position: 2
      prefix: "-g"
    
outputs:
  bam:
    type: stdout
