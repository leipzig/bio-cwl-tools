#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

doc: |
  convert BAM file to BED or BEDPE (in case of paired end)

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

baseCommand: ["bedtools", "bamtobed"]
stdout: |
  ${
    if( inputs.is_paired_end ){
      return( inputs.bam.nameroot + ".bedpe")
    } else{
      return( inputs.bam.nameroot + ".bed")
    }
  }

inputs:
  bam:
    type: File
    inputBinding:
      prefix: -i
      position: 10
  is_paired_end:
    type: boolean
    default: False
    inputBinding:
      prefix: -bedpe
      position: 1
 
outputs:
  bed:
    type: stdout
