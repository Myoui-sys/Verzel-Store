import { test, expect } from "@playwright/test";

const URL_LOJA = "https://verzel-store.qa-test-verzel-store.workers.dev/";

test.describe("Cupons de desconto", () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(URL_LOJA);
  });

  test("@CT-001 aplica cupom válido sobre o subtotal", async ({ page }) => {
    const calca = page.getByRole("article", {
      name: "Calça Jeans Slim",
    });

    const bone = page.getByRole("article", {
      name: "Boné Aba Curva",
    });

    await calca.getByRole("button", { name: "Adicionar ao carrinho" }).click();

    await bone.getByRole("button", { name: "Adicionar ao carrinho" }).click();

    await bone.getByRole("button", { name: "Adicionar ao carrinho" }).click();

    await page.getByRole("link", { name: /Carrinho/ }).click();

    await expect(page).toHaveURL(/\/carrinho$/);

    const resumo = page.getByRole("region", {
      name: "Resumo do pedido",
    });

    await expect(resumo.locator('[data-valor="subtotal"]')).toHaveText(
      "R$ 239,70",
    );

    await page
      .getByRole("textbox", { name: "Cupom de desconto" })
      .fill("BEMVINDO10");

    await page.getByRole("button", { name: "Aplicar cupom" }).click();

    await expect(
      page.getByText(/Cupom\s+BEMVINDO10\s+aplicado\./),
    ).toBeVisible();

    await expect(resumo.locator('[data-valor="desconto"]')).toHaveText(
      "- R$ 23,97",
    );

    await expect(resumo.locator('[data-valor="frete"]')).toHaveText("Grátis");

    await expect(resumo.locator('[data-valor="total"]')).toHaveText(
      "R$ 215,73",
    );
  });

  test("@CT-003 rejeita cupom inexistente", async ({ page }) => {
    const mochila = page.getByRole("article", {
      name: "Mochila Urbana 20L",
    });

    await mochila
      .getByRole("button", { name: "Adicionar ao carrinho" })
      .click();

    await page.getByRole("link", { name: /Carrinho/ }).click();

    await expect(page).toHaveURL(/\/carrinho$/);

    await page
      .getByRole("textbox", { name: "Cupom de desconto" })
      .fill("CUPOMINVALIDO");

    await page.getByRole("button", { name: "Aplicar cupom" }).click();

    await expect(
      page.getByText("Cupom inválido.", { exact: true }),
    ).toBeVisible();

    const resumo = page.getByRole("region", {
      name: "Resumo do pedido",
    });

    await expect(resumo.locator('[data-valor="subtotal"]')).toHaveText(
      "R$ 100,00",
    );

    await expect(resumo.locator('[data-valor="desconto"]')).toHaveText(
      "R$ 0,00",
    );

    await expect(resumo.locator('[data-valor="frete"]')).toHaveText("R$ 19,90");

    await expect(resumo.locator('[data-valor="total"]')).toHaveText(
      "R$ 119,90",
    );
  });
});
