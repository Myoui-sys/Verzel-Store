import { test, expect } from "@playwright/test";

const URL_LOJA = "https://verzel-store.qa-test-verzel-store.workers.dev/";

test.describe("Cálculo do frete", () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(URL_LOJA);
  });

  test("@CT-010 mantém frete grátis após aplicar o desconto", async ({
    page,
  }) => {
    const tenis = page.getByRole("article", {
      name: "Tênis Casual Urbano",
    });

    const meias = page.getByRole("article", {
      name: "Kit 3 Pares de Meias",
    });

    await tenis.getByRole("button", { name: "Adicionar ao carrinho" }).click();

    await meias.getByRole("button", { name: "Adicionar ao carrinho" }).click();

    await page.getByRole("link", { name: /Carrinho/ }).click();

    await expect(page).toHaveURL(/\/carrinho$/);

    const resumo = page.getByRole("region", {
      name: "Resumo do pedido",
    });

    await expect(resumo.locator('[data-valor="subtotal"]')).toHaveText(
      "R$ 219,80",
    );

    await expect(resumo.locator('[data-valor="frete"]')).toHaveText("Grátis");

    await page
      .getByRole("textbox", { name: "Cupom de desconto" })
      .fill("BEMVINDO10");

    await page.getByRole("button", { name: "Aplicar cupom" }).click();

    await expect(resumo.locator('[data-valor="subtotal"]')).toHaveText(
      "R$ 219,80",
    );

    await expect(resumo.locator('[data-valor="desconto"]')).toHaveText(
      "- R$ 21,98",
    );

    await expect(resumo.locator('[data-valor="frete"]')).toHaveText("Grátis");

    await expect(resumo.locator('[data-valor="total"]')).toHaveText(
      "R$ 197,82",
    );

    await expect(
      page.getByText(/Faltam .* para o frete grátis/),
    ).not.toBeVisible();
  });
});
