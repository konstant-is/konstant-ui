// src/components/grid.tsx
import { Slot } from "@radix-ui/react-slot";
import clsx from "clsx";

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
    console.log(result);
  }
  if (extra) {
    Object.entries(extra).forEach(([key, value]) => {
      const resolvedKey = prefix ? `${prefix}-${key}` : key;
      if (value !== void 0) processResponsiveValue(resolvedKey, value);
    });
  }
  console.log({ result });
  return result;
}

// src/components/grid.tsx
import { jsx } from "react/jsx-runtime";
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
  const Comp = asChild ? Slot : "div";
  const injectStyles = rb("grid", responsive, {
    cols,
    rows,
    gutter,
    rowGap,
    colGap
  });
  return /* @__PURE__ */ jsx(Comp, { className: clsx("grid", className), style: { ...injectStyles, ...style }, children });
};
var GridCol = ({ asChild, children }) => {
  const Comp = asChild ? Slot : "div";
  return /* @__PURE__ */ jsx(Comp, { children });
};

// src/components/stack.tsx
import { Slot as Slot2 } from "@radix-ui/react-slot";

// src/lib/utils.ts
import clsx2 from "clsx";
function cn(...inputs) {
  return clsx2(inputs);
}

// src/components/stack.tsx
import { jsx as jsx2 } from "react/jsx-runtime";
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
  const Comp = asChild ? Slot2 : "div";
  const injectStyles = rb("stack", responsive, {
    direction,
    alignItems,
    justify,
    flex,
    gap
  });
  return /* @__PURE__ */ jsx2(Comp, { className: cn("stack", className), style: { ...injectStyles, ...style }, ...props });
};
export {
  Grid,
  GridCol,
  Stack
};
//# sourceMappingURL=index.js.map