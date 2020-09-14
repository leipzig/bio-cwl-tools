#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

doc: |
  generate coverage tracks in bedgraph format from reads in BED

hints:
  ResourceRequirement:
    coresMin: 1
    ramMin: 15000
  DockerRequirement:
    dockerPull: biocontainers/bedtools:v2.27.1dfsg-4-deb_cv1
  SoftwareRequirement:
    packages:
      bedtools:
        specs: [ "http://identifiers.org/biotools/bedtools" ]
        version: [ "2.27.1" ]
  
baseCommand: ["bedtools", "genomecov"]
arguments:
  - valueFrom: "-bg"
    position: 1
stdout: $(inputs.bed.nameroot).bedgraph

inputs:
  bed:
    type: File
    inputBinding:
      prefix: "-i"
      position: 2
  reference_info:
    type: File
    inputBinding:
      prefix: "-g"
      position: 3

outputs:
  bedgraph:
    type: stdout
    
