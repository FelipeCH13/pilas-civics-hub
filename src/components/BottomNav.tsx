import { Link, useLocation } from "@tanstack/react-router";
import { Home, LayoutGrid, User } from "lucide-react";
import { cn } from "@/lib/utils";

const items = [
  { to: "/home", label: "Inicio", icon: Home },
  { to: "/categorias", label: "Categorías", icon: LayoutGrid },
  { to: "/perfil", label: "Perfil", icon: User },
] as const;

export function BottomNav() {
  const { pathname } = useLocation();
  return (
    <nav className="fixed bottom-0 left-0 right-0 z-40 border-t border-border bg-background/95 backdrop-blur">
      <ul className="mx-auto flex max-w-xl items-stretch justify-around px-2 pb-[env(safe-area-inset-bottom)] pt-2">
        {items.map(({ to, label, icon: Icon }) => {
          const active =
            pathname === to || (to !== "/home" && pathname.startsWith(to));
          return (
            <li key={to} className="flex-1">
              <Link
                to={to}
                className={cn(
                  "flex flex-col items-center gap-1 rounded-lg px-3 py-2 text-xs font-medium transition-colors",
                  active
                    ? "text-primary"
                    : "text-muted-foreground hover:text-foreground",
                )}
              >
                <Icon className={cn("h-5 w-5", active && "stroke-[2.5]")} />
                {label}
              </Link>
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
