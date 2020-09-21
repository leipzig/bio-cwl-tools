#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

doc: |
  Bam to fastq conversion

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.bam_sorted)

hints:
  ResourceRequirement:
    coresMin: 1
    ramMin: 20000
  DockerRequirement:
    dockerPull: quay.io/biocontainers/samtools:1.2-0
  SoftwareRequirement:
    packages:
      samtools:
        specs: [ "http://identifiers.org/biotools/samtools" ]
        version: [ "1.10" ]

baseCommand: ["samtools", "fastq"]

inputs:
  bam_sorted:
    doc: sorted bam input file
    type: File
    inputBinding:
      position: 2
  threads:
    doc: "Number of processors to use"
    type: int?
    inputBinding:
      position: 2
      prefix: "--threads"

stdout: |
  ${
    if (self){
      var val = self.fastq;
    } else {
      var val = inputs.bam_sorted.nameroot;
    }
    return val + '.fastq'
  }

outputs:
  fastq:
    type: stdout
      
    
