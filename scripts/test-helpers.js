const getType = (v) => v === null ? 'null' : Array.isArray(v) ? 'array' : typeof v;
const makeString = (v) => '' + v;
const makeNumber = (v) => Number(v);
const isValidValue = (v) => {
  const t = getType(v);
  if (t === 'null' || t === 'undefined' || v !== v) return false;
  return v !== '' && v !== 'undefined' && v !== 'null';
};
const isHashed = (v) => !v ? false : makeString(v).match('^[A-Fa-f0-9]{64}$') !== null;
const toFiniteNumber = (v) => {
  if (!isValidValue(v)) return undefined;
  const t = getType(v);
  if (t !== 'number' && t !== 'string') return undefined;
  if (t === 'string' && v.trim() === '') return undefined;
  const p = makeNumber(v);
  if (p * 0 !== 0) return undefined;
  return p;
};

console.log('isValidValue empty string:', isValidValue(''));
console.log('isValidValue valid string:', isValidValue('hello'));
console.log('isHashed short:', isHashed('abc'));
console.log('isHashed 64 hex:', isHashed('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'));
console.log('toFiniteNumber numeric string:', toFiniteNumber('125.50'));
console.log('toFiniteNumber invalid string:', toFiniteNumber('abc'));
