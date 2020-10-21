#!/usr/bin/env cwl-runner
cwlVersion: v1.0
class: CommandLineTool

hints:
  DockerRequirement:
    dockerPull: truwl/sra-tools:2.10.3--pl526haddd2b5_0
  SoftwareRequirement:
    packages:
      sratoolkit:
        specs: [ "https://bio.tools/sra-tools" ]
        version: [ "2.10.3" ]

inputs:
  accession:
    type: string
    inputBinding:
      position: 4
    doc: |
      SRA read accession
  transport:
    type: string?
    inputBinding:
      position: 3
      prefix: '-t'
    doc: |
      Transport protocol to use 'fasp', 'http' or 'both'

arguments: ["-O", '.']

outputs:
  sra_file:
    type: File
    outputBinding:
      glob: $(inputs.accession)/$(inputs.accession).sra

baseCommand: [prefetch]

$namespaces:
  s: http://schema.org/

$schemas:
- http://schema.org/version/9.0/schemaorg-current-http.rdf

s:name: "prefetch"
s:license: http://www.apache.org/licenses/LICENSE-2.0

s:isPartOf:
  class: s:CreativeWork
  s:name: Common Workflow Language
  s:url: http://commonwl.org/

s:creator:
- class: s:Organization
  s:legalName: "Cincinnati Children's Hospital Medical Center"
  s:location:
  - class: s:PostalAddress
    s:addressCountry: "USA"
    s:addressLocality: "Cincinnati"
    s:addressRegion: "OH"
    s:postalCode: "45229"
    s:streetAddress: "3333 Burnet Ave"
    s:telephone: "+1(513)636-4200"
  s:logo: "https://www.cincinnatichildrens.org/-/media/cincinnati%20childrens/global%20shared/childrens-logo-new.png"
  s:department:
  - class: s:Organization
    s:legalName: "Allergy and Immunology"
    s:department:
    - class: s:Organization
      s:legalName: "Barski Research Lab"
      s:member:
      - class: s:Person
        s:name: Michael Kotliar
        s:email: mailto:misha.kotliar@gmail.com
        s:sameAs:
        - id: http://orcid.org/0000-0002-6486-3898

doc: |
  Tool runs prefetch from NCBI SRA toolkit
