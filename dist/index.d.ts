import { PropsWithChildren, CSSProperties } from 'react';

type BreakpointValues<T> = {
    sm?: T;
    md?: T;
    lg?: T;
};
type ResponsiveValue<T> = T | BreakpointValues<T>;
type ResponsiveStyle = {
    padding?: ResponsiveValue<CSSProperties['padding']> | ResponsiveValue<{
        top?: CSSProperties['paddingTop'];
        bottom?: CSSProperties['paddingBottom'];
        left?: CSSProperties['paddingLeft'];
        right?: CSSProperties['paddingRight'];
    }>;
};
type UIComponentProps<P = unknown> = P & PropsWithChildren<{
    className?: string;
    style?: React.CSSProperties;
    responsive?: ResponsiveStyle;
}>;

type GridProps = UIComponentProps<{
    cols?: number;
    gutter?: number;
    asChild?: boolean;
}>;
declare const Grid: React.FC<GridProps>;
type GridColProps = UIComponentProps<{
    asChild?: boolean;
}>;
declare const GridCol: React.FC<GridColProps>;

type StackProps = {
    asChild?: boolean;
    direction?: ResponsiveValue<CSSProperties['flexDirection']>;
    alignItems?: ResponsiveValue<CSSProperties['alignItems']>;
    justify?: ResponsiveValue<CSSProperties['justifyContent']>;
    flex?: ResponsiveValue<CSSProperties['flex']>;
    gap?: ResponsiveValue<CSSProperties['gap']>;
} & UIComponentProps;
declare const Stack: React.FC<StackProps>;

export { Grid, GridCol, type GridColProps, type GridProps, Stack, type StackProps };
