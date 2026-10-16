# Tableau – Pasos para crear el Sales Dashboard
**BIA Mentoring Program | Module 10 | Stephanie Arredondo**

---

## Antes de empezar
Descarga **Tableau Public** (gratis): https://public.tableau.com/app/discover
Tienes dos archivos CSV para cargar:
- `sales_transactions.csv` — 209 transacciones (Jan–Sep 2026)
- `sales_targets.csv` — Cuotas mensuales por rep

---

## Paso 1 – Conectar los datos

1. Abre Tableau Public → **Connect to Data** → **Text File**
2. Selecciona `sales_transactions.csv`
3. En el panel **Data Source**, arrastra también `sales_targets.csv` al área de unión
4. Une las tablas:
   - Clic en el join entre tablas → tipo: **Left Join**
   - Join condition: `RepID = RepID` y `PeriodDate ≈ SaleDate` (month match)
   - *Alternativa más fácil:* mantenerlas separadas y crear dos fuentes de datos en Tableau
5. Verifica que los campos estén bien tipados:
   - `SaleDate` → Date
   - `Amount`, `TargetAmount` → Number (decimal)
   - `Region`, `RepName`, `Category` → String

---

## Paso 2 – Crear campos calculados

Antes de construir vistas, crea estos campos en **Analysis → Create Calculated Field**:

| Campo | Fórmula |
|-------|---------|
| **Quota Attainment %** | `SUM([Amount]) / SUM([TargetAmount])` |
| **Month-Year** | `DATETRUNC('month', [SaleDate])` |
| **Quarter** | `DATEPART('quarter', [SaleDate])` |
| **Performance Flag** | `IF SUM([Amount]) >= SUM([TargetAmount]) THEN "On Target" ELSE "Below Target" END` |

---

## Paso 3 – Crear las 4 visualizaciones (Sheets)

### Sheet 1 – KPI Cards (Total Revenue, Deals Closed, Quota %)
1. Nueva hoja → renombrar "KPI Cards"
2. Arrastra `Amount` a **Text** en el Marks card
3. Cambia el chart type a **Text**
4. Haz click derecho en Amount → **Quick Table Calculation → Running Total** (no, solo SUM)
5. Crea una para cada KPI:
   - `SUM(Amount)` → formato moneda
   - `COUNT(TransactionID)` → formato número entero
   - `Quota Attainment %` → formato porcentaje
6. Usa **Show Me → Text Table** para mostrarlos como tarjetas
7. Para el estilo de "card": Format → Shading → fondo blanco, bordes gris claro

### Sheet 2 – Revenue by Region (Bar chart)
1. Nueva hoja → "Revenue by Region"
2. Arrastra `Region` a **Columns**
3. Arrastra `Amount` (SUM) a **Rows**
4. Chart type: **Bar**
5. Arrastra `Region` a **Color** en Marks
   - North: azul marino `#1B4F8A`
   - South: azul medio `#2E86C1`
   - West: azul claro `#5DADE2`
6. Agrega `SUM(Amount)` en **Label** → mostrar en top de cada barra
7. Ordena de mayor a menor: clic en eje → Sort → Descending

### Sheet 3 – Monthly Sales Trend (Line chart)
1. Nueva hoja → "Sales Trend"
2. Arrastra `SaleDate` a **Columns** → clic derecho → **Month (continuous)**
3. Arrastra `Amount` (SUM) a **Rows**
4. Chart type: **Line**
5. Opcional: arrastra `Region` a **Color** para ver líneas por región
6. Agrega una **Reference Line**: Analytics pane → Reference Line → Average
7. Color de línea: `#1B4F8A`, grosor 2px

### Sheet 4 – Top Reps Ranking (Bar horizontal)
1. Nueva hoja → "Top 5 Reps"
2. Arrastra `RepName` a **Rows**
3. Arrastra `Amount` (SUM) a **Columns**
4. Chart type: **Bar** → cambiar a horizontal (Swap Rows/Columns)
5. Arrastra `Performance Flag` a **Color**:
   - "On Target" → verde `#27AE60`
   - "Below Target" → rojo `#E74C3C`
6. Ordena por SUM(Amount) descendente
7. Filtra Top 5: clic derecho en RepName → Filter → Top 5 by SUM(Amount)
8. Agrega `SUM(Amount)` en **Label**

---

## Paso 4 – Crear el Dashboard

1. Clic en el ícono de Dashboard (parte inferior) → **New Dashboard**
2. Tamaño: **Fixed size → 1200 x 800** (o "Automatic")
3. Arrastra las sheets al canvas en este orden:

```
┌─────────────────────────────────────────────────────┐
│  FILTROS: Time Period │ Region │ Sales Rep           │
├───────────┬───────────┬───────────┬─────────────────┤
│ Total     │ Deals     │ Quota     │ Avg Revenue     │
│ Revenue   │ Closed    │ Attain %  │ per Rep         │
├───────────────────────┬─────────────────────────────┤
│  Revenue by Region    │   Monthly Sales Trend       │
│  (Bar Chart)          │   (Line Chart)              │
├───────────────────────┴─────────────────────────────┤
│          Top 5 Reps Ranking (Horizontal Bar)        │
└─────────────────────────────────────────────────────┘
```

4. Para los **filtros globales**:
   - Clic en cualquier chart → filtro de Time Period → "Apply to Worksheets → All Using This Data Source"
   - Repite con Region y RepName

---

## Paso 5 – Aplicar formato profesional

| Elemento | Configuración |
|----------|--------------|
| Fuente general | Tableau Book o Arial, 11pt |
| Título del dashboard | Bold, 16pt, color `#1B4F8A` |
| Fondo de sheets | Blanco (`#FFFFFF`) |
| Bordes de sheets | Gris claro, 1px |
| Padding entre sheets | 8px |
| Tooltips | Activados — describe el dato en lenguaje de negocio |
| Colores | Azul marino para "On Target", rojo para "Below Target" |

**Regla de oro:** cada elemento del dashboard debe responder a una pregunta de James.
Antes de publicar pregúntate: *"¿Es este elemento necesario?"*

---

## Paso 6 – Publicar y entregar

1. **File → Save to Tableau Public**
2. Inicia sesión con tu cuenta gratuita en public.tableau.com
3. El dashboard queda en línea con una URL pública → esa URL es tu entrega
4. Copia la URL y adjúntala en el formulario del módulo

---

## Checklist de evaluación (Module 10)

- [ ] Todas las KPIs definidas en Module 4 están visibles
- [ ] Filtros de Region, Time Period y Sales Rep funcionan
- [ ] Colores comunican estado (verde = target met, rojo = below)
- [ ] Sin jargon técnico en etiquetas
- [ ] Tooltips descriptivos en cada chart
- [ ] Layout coincide con el wireframe
- [ ] Dashboard carga en menos de 5 segundos

---

*BIA Mentoring Program | Module 10 | Stephanie Arredondo*
