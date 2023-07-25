import { g as createMemo } from './index.js';

const Editable = props => {
  return createMemo(() => props.children);
};

export { Editable as E };
