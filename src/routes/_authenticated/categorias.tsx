import { createFileRoute } from "@tanstack/react-router";
import HomePage from "./home";

export const Route = createFileRoute("/_authenticated/categorias")({
  component: HomePage,
});
