# @summary A yum repository proxy
type Epel::Proxy = Variant[
  Regexp['.+'],
  Enum['absent'],
]
