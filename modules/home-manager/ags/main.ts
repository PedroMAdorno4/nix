import { App } from "astal/gtk3";
import Bar from "./widgets/Bar";
import style from "./style.scss";

App.start({
  css: style,
  main: () => App.get_monitors().map(Bar),
});

export {};
