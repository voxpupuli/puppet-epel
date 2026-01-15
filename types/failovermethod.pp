# @summary A yum repository failover method
type Epel::Failovermethod = Enum[
  'absent',
  'priority',
  'roundrobin'
]
