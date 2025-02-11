"use strict";
var __create = Object.create;
var __defProp = Object.defineProperty;
var __getOwnPropDesc = Object.getOwnPropertyDescriptor;
var __getOwnPropNames = Object.getOwnPropertyNames;
var __getProtoOf = Object.getPrototypeOf;
var __hasOwnProp = Object.prototype.hasOwnProperty;
var __export = (target, all) => {
  for (var name in all)
    __defProp(target, name, { get: all[name], enumerable: true });
};
var __copyProps = (to, from, except, desc) => {
  if (from && typeof from === "object" || typeof from === "function") {
    for (let key of __getOwnPropNames(from))
      if (!__hasOwnProp.call(to, key) && key !== except)
        __defProp(to, key, { get: () => from[key], enumerable: !(desc = __getOwnPropDesc(from, key)) || desc.enumerable });
  }
  return to;
};
var __toESM = (mod, isNodeMode, target) => (target = mod != null ? __create(__getProtoOf(mod)) : {}, __copyProps(
  // If the importer is in node compatibility mode or this is not an ESM
  // file that has been converted to a CommonJS file using a Babel-
  // compatible transform (i.e. "__esModule" has not been set), then set
  // "default" to the CommonJS "module.exports" for node compatibility.
  isNodeMode || !mod || !mod.__esModule ? __defProp(target, "default", { value: mod, enumerable: true }) : target,
  mod
));
var __toCommonJS = (mod) => __copyProps(__defProp({}, "__esModule", { value: true }), mod);

// src/index.ts
var index_exports = {};
__export(index_exports, {
  Grid: () => Grid,
  GridCol: () => GridCol,
  Gutter: () => Gutter,
  Stack: () => Stack
});
module.exports = __toCommonJS(index_exports);

// src/components/grid.tsx
var import_react_slot = require("@radix-ui/react-slot");
var import_clsx = __toESM(require("clsx"), 1);

// src/lib/responsive.ts
function rb(prefix, responsive, extra) {
  let result = {};
  const processResponsiveValue = (key, value) => {
    if (typeof value === "object" && value !== null) {
      Object.entries(value).forEach(([bp, bpValue]) => {
        result = {
          ...result,
          [`--${bp}-${key}`]: bpValue
        };
      });
    } else {
      result = { ...result, [`--${key}`]: value };
    }
  };
  if (responsive) {
    Object.entries(responsive).forEach(([key, value]) => {
      const resolvedKey = prefix ? `${prefix}-${key}` : key;
      if (value !== void 0) processResponsiveValue(resolvedKey, value);
    });
  }
  if (extra) {
    Object.entries(extra).forEach(([key, value]) => {
      const resolvedKey = prefix ? `${prefix}-${key}` : key;
      if (value !== void 0) processResponsiveValue(resolvedKey, value);
    });
  }
  return result;
}

// src/components/grid.tsx
var import_jsx_runtime = require("react/jsx-runtime");
var Grid = ({
  cols,
  rows,
  gutter,
  rowGap,
  colGap,
  asChild,
  children,
  responsive,
  className,
  style
}) => {
  const Comp = asChild ? import_react_slot.Slot : "div";
  const injectStyles = rb("grid", responsive, {
    cols,
    rows,
    gutter,
    rowGap,
    colGap
  });
  return /* @__PURE__ */ (0, import_jsx_runtime.jsx)(Comp, { className: (0, import_clsx.default)("grid", className), style: { ...injectStyles, ...style }, children });
};
var GridCol = ({ asChild, children }) => {
  const Comp = asChild ? import_react_slot.Slot : "div";
  return /* @__PURE__ */ (0, import_jsx_runtime.jsx)(Comp, { children });
};

// src/components/stack.tsx
var import_react_slot2 = require("@radix-ui/react-slot");

// src/lib/utils.ts
var import_clsx2 = __toESM(require("clsx"), 1);
function cn(...inputs) {
  return (0, import_clsx2.default)(inputs);
}

// src/components/stack.tsx
var import_jsx_runtime2 = require("react/jsx-runtime");
var Stack = ({
  asChild,
  className,
  style,
  responsive,
  direction,
  alignItems,
  justify,
  flex,
  gap,
  ...props
}) => {
  const Comp = asChild ? import_react_slot2.Slot : "div";
  const injectStyles = rb("stack", responsive, {
    direction,
    alignItems,
    justify,
    flex,
    gap
  });
  return /* @__PURE__ */ (0, import_jsx_runtime2.jsx)(Comp, { className: cn("stack", className), style: { ...injectStyles, ...style }, ...props });
};

// src/components/gutter.tsx
var import_react_slot3 = require("@radix-ui/react-slot");
var import_clsx3 = __toESM(require("clsx"), 1);
var import_jsx_runtime3 = require("react/jsx-runtime");
var Gutter = ({
  asChild,
  className,
  left = true,
  right = true,
  ...rest
}) => {
  const Comp = asChild ? import_react_slot3.Slot : "div";
  return /* @__PURE__ */ (0, import_jsx_runtime3.jsx)(
    Comp,
    {
      className: (0, import_clsx3.default)("gutter", className, {
        gutter: left && right,
        gutter_left: left && !right,
        gutter_right: right && !left
      }),
      ...rest
    }
  );
};
// Annotate the CommonJS export names for ESM import in node:
0 && (module.exports = {
  Grid,
  GridCol,
  Gutter,
  Stack
});
//# sourceMappingURL=index.cjs.map