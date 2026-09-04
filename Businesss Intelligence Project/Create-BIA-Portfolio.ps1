# =====================================
# Business Intelligence Analysis Portfolio
# Project Structure Generator
# =====================================

$basePath = "C:\Users\StephanieArredondo\Documents\EPAM\Plan de Estudio\business-intelligence-analysis-mentoring-program"

Write-Host "Creating project structure..." -ForegroundColor Cyan

# Root files
$rootFiles = @(
    "README.md",
    "LICENSE",
    ".gitignore"
)

# Directories
$directories = @(
    "docs\01-professional-assessment",
    "docs\02-project-discovery",
    "docs\03-requirements-engineering",
    "docs\04-professional-development",

    "portfolio-artifacts\dashboard-design",
    "portfolio-artifacts\data-modeling",
    "portfolio-artifacts\data-quality",
    "portfolio-artifacts\requirements-case-study",
    "portfolio-artifacts\risk-register",
    "portfolio-artifacts\uat",

    "assets\diagrams",
    "assets\images",
    "assets\screenshots",
    "assets\wireframes",

    "templates"
)

# Create root folder
New-Item -ItemType Directory -Path $basePath -Force | Out-Null

# Create directories
foreach ($dir in $directories) {
    New-Item -ItemType Directory -Path (Join-Path $basePath $dir) -Force | Out-Null
}

# Create root files
foreach ($file in $rootFiles) {
    New-Item -ItemType File -Path (Join-Path $basePath $file) -Force | Out-Null
}

# Create documentation files
$files = @(
    "docs\01-professional-assessment\README.md",
    "docs\01-professional-assessment\professional-readiness-assessment.md",

    "docs\02-project-discovery\README.md",
    "docs\02-project-discovery\sales-dashboard-discovery-plan.md",

    "docs\03-requirements-engineering\README.md",
    "docs\03-requirements-engineering\sales-dashboard-requirements.md",

    "docs\04-professional-development\README.md",
    "docs\04-professional-development\bia-a2-study-roadmap.md",

    "portfolio-artifacts\dashboard-design\README.md",
    "portfolio-artifacts\dashboard-design\dashboard-wireframes.md",

    "portfolio-artifacts\data-modeling\README.md",
    "portfolio-artifacts\data-modeling\dimensional-model.md",
    "portfolio-artifacts\data-modeling\star-schema.md",

    "portfolio-artifacts\data-quality\README.md",
    "portfolio-artifacts\data-quality\data-quality-rules.md",

    "portfolio-artifacts\requirements-case-study\README.md",
    "portfolio-artifacts\requirements-case-study\business-analysis-case-study.md",

    "portfolio-artifacts\risk-register\README.md",
    "portfolio-artifacts\risk-register\project-risk-register.md",

    "portfolio-artifacts\uat\README.md",
    "portfolio-artifacts\uat\user-acceptance-testing-plan.md",

    "templates\meeting-notes-template.md",
    "templates\stakeholder-interview-template.md",
    "templates\user-story-template.md",
    "templates\risk-template.md"
)

foreach ($file in $files) {
    New-Item -ItemType File -Path (Join-Path $basePath $file) -Force | Out-Null
}

Write-Host ""
Write-Host "Project created successfully!" -ForegroundColor Green
Write-Host "Location:" -ForegroundColor Yellow
Write-Host $basePath