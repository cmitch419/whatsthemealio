const toTitleCase = (str) =>
  str.replace(/_/g,' ')
    .split(/\s+/g)
    .map(word => word.slice(0,1).toUpperCase() + word.slice(1))
    .join(' ')

export {
  toTitleCase,
}
