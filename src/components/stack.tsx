import { CSSProperties } from "react";
import { Slot } from "@radix-ui/react-slot";

import { rb, ResponsiveValue } from "@/lib/responsive";
import { cn } from "@/lib/utils";
import { UIComponentProps } from "@/types";

import css from "./stack.module.scss";

type Props = {
  asChild?: boolean;
  direction?: ResponsiveValue<CSSProperties["flexDirection"]>;
} & UIComponentProps;

export const Stack = ({
  asChild,
  style,
  direction = "row",
  responsive,
  ...props
}: Props) => {
  const Comp = asChild ? Slot : "div";

  const injectStyles = rb("stack", responsive, {
    direction,
  });
  //   const injectStyles = {
  //     ...resolveBreakpoint(direction, 'stack-direction'),
  //     ...resolveBreakpoint(direction, 'stack-direction'),
  //     ...resolveResponsive(responsive, 'stack'),
  //     // "--stack-direction": 'var(--stack-direction, column)',
  //     // 'align-items': 'var(--stack-align, stretch)',
  //     // 'justify-content': 'var(--stack-justify, flex-start)',
  //     // flex: 'var(--stack-flex, initial)',
  //     // gap: 'var(--stack-gap, 0)',
  //   } as CSSProperties

  return (
    <Comp
      className={cn(css.ctr)}
      style={{ ...injectStyles, ...style }}
      {...props}
    />
  );
};
