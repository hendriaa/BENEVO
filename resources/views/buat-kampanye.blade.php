<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Buat Kampanye</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-page: #f5f0fa;
            --brand-purple: #583296;
            --brand-purple-dark: #2d164d;
            --brand-purple-light: #ece3f7;
            --brand-purple-border: #855cb8;
            --brand-yellow: #f8df64;
            --text-dark: #1f1b26;
            --text-muted: #6e727e;
            --border-color: #ede6f5;
            --border-card: #e4dcee;
            --card-bg: #ffffff;
            --danger-red: #df584f;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        body {
            background-color: var(--bg-page);
            color: var(--text-dark);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            -webkit-font-smoothing: antialiased;
        }

        /* ========== TOPBAR HEADER ========== */
        .topbar-header {
            background-color: #ffffff;
            border-bottom: 1px solid var(--border-color);
            height: 72px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 40px;
            position: sticky;
            top: 0;
            z-index: 99;
        }

        .header-left {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .brand-link {
            display: flex;
            align-items: center;
            gap: 10px;
            text-decoration: none;
        }

        .brand-logo-badge {
            width: 42px;
            height: 42px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .brand-logo-badge img {
            width: 100%;
            height: 100%;
            object-fit: contain;
        }

        .brand-text-block {
            display: flex;
            flex-direction: column;
            line-height: 1;
        }

        .brand-name {
            font-size: 1.85rem;
            font-weight: 800;
            color: #6d3ca1;
            position: relative;
            display: inline-flex;
            letter-spacing: -0.03em;
        }

        .brand-yellow-dot {
            width: 8px;
            height: 8px;
            background-color: var(--brand-yellow);
            border-radius: 50%;
            position: absolute;
            top: 2px;
            right: -10px;
        }

        .brand-sub {
            font-size: 0.62rem;
            font-weight: 800;
            letter-spacing: 0.12em;
            color: #6d3ca1;
            margin-top: 3px;
        }

        .breadcrumb-sep {
            color: #b5adc4;
            font-size: 1.1rem;
            font-weight: 600;
            user-select: none;
        }

        .breadcrumb-link {
            font-size: 0.95rem;
            font-weight: 600;
            color: #6c667a;
            text-decoration: none;
            transition: color 0.15s;
        }

        .breadcrumb-link:hover {
            color: var(--brand-purple);
        }

        .breadcrumb-current {
            font-size: 0.95rem;
            font-weight: 800;
            color: var(--brand-purple);
        }

        .header-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .avatar-circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid #ddd2ef;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #e9dbcb;
        }

        .avatar-circle svg {
            width: 100%;
            height: 100%;
        }

        /* ========== STEPPER BAR ========== */
        .stepper-section {
            background-color: #ffffff;
            border-bottom: 1px solid var(--border-color);
            padding: 16px 40px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .stepper-container {
            display: flex;
            align-items: center;
            gap: 16px;
            max-width: 900px;
            width: 100%;
            justify-content: space-between;
        }

        .step-item {
            display: flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            user-select: none;
            transition: all 0.2s ease;
        }

        .step-circle {
            width: 32px;
            height: 32px;
            border-radius: 50%;
            background-color: #eae3f3;
            color: #7b7489;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.92rem;
            font-weight: 800;
            transition: all 0.2s ease;
            flex-shrink: 0;
        }

        .step-label {
            font-size: 0.95rem;
            font-weight: 600;
            color: #8c8699;
            transition: all 0.2s ease;
        }

        .step-item.active .step-circle {
            background-color: var(--brand-purple);
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(88, 50, 150, 0.35);
        }

        .step-item.active .step-label {
            color: var(--brand-purple);
            font-weight: 800;
        }

        .step-item.completed .step-circle {
            background-color: var(--brand-purple);
            color: #ffffff;
        }

        .step-item.completed .step-label {
            color: var(--brand-purple);
            font-weight: 700;
        }

        .step-divider {
            color: #d1c8de;
            font-size: 1.1rem;
            font-weight: 600;
        }

        /* ========== MAIN CONTAINER ========== */
        .main-content {
            flex: 1;
            max-width: 1180px;
            width: 100%;
            margin: 0 auto;
            padding: 36px 24px 60px 24px;
            display: flex;
            flex-direction: column;
            gap: 28px;
        }

        /* Title Area */
        .page-intro {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .page-title {
            font-size: 1.85rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            letter-spacing: -0.025em;
        }

        .page-subtitle {
            font-size: 0.95rem;
            color: #5c556b;
            line-height: 1.5;
            max-width: 820px;
        }

        /* ========== STEP 1: CATEGORY SELECTION ========== */
        .category-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
        }

        .category-card {
            background-color: var(--card-bg);
            border: 1.5px solid var(--border-card);
            border-radius: 18px;
            padding: 22px 20px;
            cursor: pointer;
            transition: all 0.22s cubic-bezier(0.16, 1, 0.3, 1);
            position: relative;
            display: flex;
            flex-direction: column;
            gap: 12px;
            box-shadow: 0 4px 15px rgba(100, 60, 150, 0.04);
        }

        .category-card:hover {
            transform: translateY(-3px);
            border-color: var(--brand-purple-border);
            box-shadow: 0 8px 24px rgba(100, 60, 150, 0.1);
        }

        .category-card.selected {
            background-color: #f1eafc;
            border: 2px solid var(--brand-purple-border);
            box-shadow: 0 8px 26px rgba(100, 60, 150, 0.14);
        }

        .category-badge-plus {
            position: absolute;
            top: 18px;
            right: 18px;
            color: #d83a3a;
            font-size: 1.3rem;
            font-weight: 900;
            line-height: 1;
        }

        .category-icon-box {
            width: 46px;
            height: 46px;
            border-radius: 12px;
            background: #faf7ff;
            border: 1px solid #ede4f7;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.6rem;
            flex-shrink: 0;
        }

        .category-card.selected .category-icon-box {
            background: #ffffff;
            border-color: #d9c7f0;
        }

        .category-card-title {
            font-size: 1.05rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            line-height: 1.25;
        }

        .category-card-desc {
            font-size: 0.82rem;
            color: #6a6378;
            line-height: 1.45;
            font-weight: 500;
        }

        /* Warning Banner */
        .warning-notice-banner {
            background-color: #e5daf3;
            border-radius: 12px;
            padding: 14px 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            color: #3b2062;
            font-size: 0.9rem;
            font-weight: 600;
        }

        .warning-icon {
            font-size: 1.2rem;
            color: #923434;
        }

        /* Category selected pill banner for Step 2 & 3 */
        .category-selected-banner {
            background-color: #dfd2f3;
            border-radius: 12px;
            padding: 12px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            font-size: 0.92rem;
            color: #381a60;
            font-weight: 600;
        }

        .category-selected-banner a {
            color: var(--brand-purple);
            font-weight: 800;
            text-decoration: underline;
            cursor: pointer;
        }

        /* Privacy banner for Step 3 */
        .privacy-banner {
            background-color: #d9cbe8;
            border-radius: 12px;
            padding: 14px 20px;
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 0.9rem;
            font-weight: 600;
            color: #2f1d4a;
        }

        .privacy-banner svg {
            width: 20px;
            height: 20px;
            flex-shrink: 0;
            stroke: currentColor;
        }

        /* ========== FORM CARDS (STEP 2 & 3) ========== */
        .form-section-card {
            background-color: var(--card-bg);
            border-radius: 20px;
            border: 1.5px solid var(--border-card);
            padding: 28px 32px;
            box-shadow: 0 4px 20px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .section-header {
            display: flex;
            align-items: flex-start;
            gap: 14px;
        }

        .section-num-badge {
            width: 30px;
            height: 30px;
            border-radius: 8px;
            background-color: #e4d8f5;
            color: #49267a;
            font-size: 0.95rem;
            font-weight: 800;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            margin-top: 2px;
        }

        .section-titles {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .section-main-title {
            font-size: 1.15rem;
            font-weight: 800;
            color: #1f1b26;
        }

        .section-sub-title {
            font-size: 0.8rem;
            color: #726c80;
            font-weight: 500;
        }

        /* Inputs & Grid Layout */
        .fields-grid-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px 24px;
        }

        .form-field-group {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .form-label {
            font-size: 0.9rem;
            font-weight: 700;
            color: #2a2533;
        }

        .required-star {
            color: #d83a3a;
            margin-left: 2px;
        }

        .input-box {
            height: 46px;
            background-color: #eee9f7;
            border: 1.5px solid transparent;
            border-radius: 10px;
            padding: 0 16px;
            font-size: 0.92rem;
            color: #1f1b26;
            font-weight: 500;
            outline: none;
            transition: all 0.2s;
            width: 100%;
        }

        .input-box:focus {
            background-color: #ffffff;
            border-color: var(--brand-purple);
            box-shadow: 0 0 0 2px rgba(88, 50, 150, 0.15);
        }

        .input-with-icon {
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: #eee9f7;
            border-radius: 10px;
            padding: 0 16px;
            height: 46px;
            border: 1.5px solid transparent;
        }

        .input-with-icon:focus-within {
            background-color: #ffffff;
            border-color: var(--brand-purple);
            box-shadow: 0 0 0 2px rgba(88, 50, 150, 0.15);
        }

        .input-with-icon input {
            border: none;
            background: transparent;
            width: 100%;
            height: 100%;
            outline: none;
            font-size: 0.92rem;
            color: #1f1b26;
            font-weight: 500;
        }

        .input-with-icon svg {
            width: 18px;
            height: 18px;
            color: #726b80;
            flex-shrink: 0;
        }

        .date-range-wrap {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 12px;
        }

        .field-subtext {
            font-size: 0.78rem;
            color: #7a7488;
            font-weight: 500;
            margin-top: 2px;
        }

        /* Photo Gallery Upload */
        .photo-gallery-layout {
            display: grid;
            grid-template-columns: 1.4fr 1fr;
            gap: 14px;
            margin-top: 4px;
        }

        .main-photo-preview {
            height: 190px;
            border-radius: 12px;
            overflow: hidden;
            background-color: #ddd4eb;
            position: relative;
        }

        .main-photo-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .sub-photos-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-template-rows: 1fr 1fr;
            gap: 10px;
            height: 190px;
        }

        .sub-photo-box {
            border-radius: 10px;
            overflow: hidden;
            background-color: #ddd4eb;
            position: relative;
        }

        .sub-photo-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        .upload-slot-btn {
            background-color: #dbd0eb;
            border: 2px dashed #bba9d8;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #583296;
            cursor: pointer;
            transition: all 0.2s;
        }

        .upload-slot-btn:hover {
            background-color: #d1c1e5;
        }

        .upload-slot-btn svg {
            width: 26px;
            height: 26px;
        }

        /* Rich Text Toolbar */
        .rich-toolbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #eee9f7;
            border-radius: 10px 10px 0 0;
            padding: 8px 14px;
            border: 1.5px solid transparent;
            border-bottom: 1px solid #ded5eb;
        }

        .rich-tools-left {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .toolbar-btn {
            background: none;
            border: none;
            font-size: 0.95rem;
            font-weight: 700;
            color: #4b4556;
            cursor: pointer;
            padding: 4px 6px;
            border-radius: 4px;
            transition: background 0.15s;
        }

        .toolbar-btn:hover {
            background-color: #ded6ee;
            color: var(--brand-purple);
        }

        .toolbar-notice {
            font-size: 0.78rem;
            color: #7b758a;
            font-weight: 500;
        }

        .btn-toolbar-save {
            background: #ffffff;
            border: 1px solid #d4c8e8;
            border-radius: 6px;
            padding: 4px 12px;
            font-size: 0.8rem;
            font-weight: 700;
            color: #4b4556;
            cursor: pointer;
        }

        .rich-textarea {
            width: 100%;
            min-height: 130px;
            background-color: #eee9f7;
            border: 1.5px solid transparent;
            border-top: none;
            border-radius: 0 0 10px 10px;
            padding: 14px 16px;
            font-size: 0.92rem;
            color: #1f1b26;
            outline: none;
            resize: vertical;
            font-family: inherit;
            line-height: 1.5;
        }

        .rich-textarea:focus {
            background-color: #ffffff;
            border-color: var(--brand-purple);
        }

        .char-counter {
            text-align: right;
            font-size: 0.78rem;
            color: #7b758a;
            font-weight: 600;
            margin-top: 4px;
        }

        /* Budget Items Table */
        .budget-header-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .btn-add-budget {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            background-color: var(--brand-purple);
            color: #ffffff;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 1.2rem;
            font-weight: 800;
            transition: transform 0.15s, background 0.15s;
        }

        .btn-add-budget:hover {
            background-color: #482580;
            transform: scale(1.06);
        }

        .budget-items-list {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .budget-item-row {
            display: grid;
            grid-template-columns: 2fr 1fr 40px;
            gap: 12px;
            align-items: center;
        }

        .btn-delete-row {
            background: none;
            border: none;
            color: #8c8599;
            cursor: pointer;
            padding: 6px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: color 0.15s, background 0.15s;
        }

        .btn-delete-row:hover {
            background-color: #fee2e2;
            color: #d83a3a;
        }

        .btn-delete-row svg {
            width: 18px;
            height: 18px;
        }

        .disbursement-row {
            display: grid;
            grid-template-columns: 1.2fr 1.8fr;
            gap: 16px;
            padding-top: 14px;
            border-top: 1px solid #ede6f5;
        }

        .budget-total-box {
            background-color: #eee9f7;
            border-radius: 12px;
            padding: 16px 20px;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .budget-total-title {
            font-size: 0.8rem;
            font-weight: 700;
            color: #635d72;
            text-transform: uppercase;
            letter-spacing: 0.05em;
        }

        .budget-total-value {
            font-size: 2.1rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            letter-spacing: -0.02em;
        }

        /* ========== STEP 3: DOKUMEN LEGALITAS ========== */
        .documents-header-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 8px;
        }

        .docs-progress-text {
            font-size: 0.92rem;
            font-weight: 700;
            color: #4b4556;
        }

        .doc-cards-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .doc-upload-card {
            background-color: #eee9f7;
            border-radius: 14px;
            padding: 20px 24px;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .doc-card-title {
            font-size: 1.05rem;
            font-weight: 800;
            color: #272132;
        }

        .doc-card-desc {
            font-size: 0.82rem;
            color: #696376;
            font-weight: 500;
        }

        .doc-chips-row {
            display: flex;
            align-items: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .doc-file-chip {
            background-color: #dfd4ee;
            border-radius: 10px;
            padding: 12px 14px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 6px;
            width: 86px;
            height: 86px;
            position: relative;
            cursor: pointer;
        }

        .doc-file-chip svg {
            width: 28px;
            height: 28px;
            stroke: #4b267c;
        }

        .doc-file-chip span {
            font-size: 0.72rem;
            font-weight: 700;
            color: #3b2260;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 70px;
        }

        .doc-chip-close {
            position: absolute;
            top: 4px;
            right: 4px;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            background-color: #bfaedc;
            color: #ffffff;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 0.65rem;
            cursor: pointer;
        }

        .doc-add-slot {
            width: 86px;
            height: 86px;
            border-radius: 10px;
            border: 2px dashed #b9a6d8;
            background: #e6dbf3;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #583296;
            cursor: pointer;
            transition: all 0.2s;
        }

        .doc-add-slot:hover {
            background-color: #dccef0;
        }

        .doc-add-slot svg {
            width: 28px;
            height: 28px;
        }

        /* Drag & Drop Upload Container */
        .dropzone-box {
            border: 2px dashed #bba8da;
            background-color: #dfd4ee;
            border-radius: 12px;
            padding: 24px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 8px;
            cursor: pointer;
            transition: all 0.2s ease;
        }

        .dropzone-box:hover {
            border-color: var(--brand-purple);
            background-color: #d8caec;
        }

        .dropzone-box svg {
            width: 28px;
            height: 28px;
            color: #4b267c;
        }

        .dropzone-text {
            font-size: 0.88rem;
            color: #4b4556;
            font-weight: 600;
        }

        .dropzone-text strong {
            color: var(--brand-purple);
            text-decoration: underline;
        }

        /* ========== STEP 4: REVIEW & PUBLISH ========== */
        .review-preview-card {
            background-color: var(--card-bg);
            border-radius: 20px;
            border: 1.5px solid var(--border-card);
            padding: 32px;
            box-shadow: 0 4px 20px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .review-hero {
            display: grid;
            grid-template-columns: 260px 1fr;
            gap: 24px;
            align-items: center;
        }

        .review-hero-img {
            width: 100%;
            height: 180px;
            border-radius: 14px;
            object-fit: cover;
        }

        .review-hero-info {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .review-category-badge {
            align-self: flex-start;
            background-color: #ede4f8;
            color: var(--brand-purple);
            font-size: 0.82rem;
            font-weight: 800;
            padding: 4px 12px;
            border-radius: 6px;
        }

        .review-title {
            font-size: 1.6rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            line-height: 1.25;
        }

        .review-target-amount {
            font-size: 1.85rem;
            font-weight: 800;
            color: #199447;
            margin-top: 4px;
        }

        .review-meta-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 16px;
            background: #faf7fd;
            border-radius: 12px;
            padding: 16px 20px;
            border: 1px solid #ede4f7;
        }

        .review-meta-item {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .review-meta-label {
            font-size: 0.75rem;
            font-weight: 700;
            color: #7a7488;
            text-transform: uppercase;
        }

        .review-meta-val {
            font-size: 0.95rem;
            font-weight: 700;
            color: #211d29;
        }

        /* Checkbox Agreement */
        .agreement-box {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            background-color: #f6f0fd;
            border-radius: 12px;
            padding: 16px 20px;
            border: 1px solid #e5daf3;
            cursor: pointer;
            user-select: none;
        }

        .agreement-checkbox {
            width: 20px;
            height: 20px;
            accent-color: var(--brand-purple);
            margin-top: 2px;
            cursor: pointer;
        }

        .agreement-text {
            font-size: 0.9rem;
            color: #3b2f50;
            line-height: 1.45;
            font-weight: 600;
        }

        /* ========== BOTTOM NAVIGATION BAR ========== */
        .bottom-nav-bar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 8px;
        }

        .btn-nav-back {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            background-color: #ede7f6;
            color: #4b3e64;
            padding: 12px 24px;
            border-radius: 9999px;
            font-size: 0.95rem;
            font-weight: 700;
            border: none;
            cursor: pointer;
            text-decoration: none;
            transition: all 0.2s;
        }

        .btn-nav-back:hover {
            background-color: #e0d6ed;
            color: #271d3c;
        }

        .btn-nav-next {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background-color: #4b237e;
            color: #ffffff;
            padding: 13px 30px;
            border-radius: 9999px;
            font-size: 0.98rem;
            font-weight: 700;
            border: none;
            cursor: pointer;
            box-shadow: 0 4px 16px rgba(75, 35, 126, 0.35);
            transition: all 0.2s;
        }

        .btn-nav-next:hover {
            background-color: #3a1964;
            transform: translateY(-1px);
            box-shadow: 0 6px 20px rgba(75, 35, 126, 0.45);
        }

        .btn-nav-next svg {
            width: 18px;
            height: 18px;
            stroke-width: 2.4;
        }

        /* ========== SUCCESS PUBLISH MODAL ========== */
        .modal-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(30, 20, 50, 0.5);
            backdrop-filter: blur(3px);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 99999;
            opacity: 0;
            visibility: hidden;
            transition: all 0.25s ease;
        }

        .modal-backdrop.show {
            opacity: 1;
            visibility: visible;
        }

        .modal-card {
            background: #ffffff;
            border-radius: 24px;
            padding: 38px 36px;
            max-width: 500px;
            width: 90%;
            text-align: center;
            box-shadow: 0 20px 50px rgba(0, 0, 0, 0.2);
            transform: scale(0.9);
            transition: transform 0.25s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .modal-backdrop.show .modal-card {
            transform: scale(1);
        }

        .modal-icon-congrats {
            width: 72px;
            height: 72px;
            border-radius: 50%;
            background-color: #daf7e5;
            color: #199447;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px auto;
            font-size: 2.2rem;
        }

        .modal-title {
            font-size: 1.6rem;
            font-weight: 800;
            color: var(--brand-purple-dark);
            margin-bottom: 10px;
        }

        .modal-text {
            font-size: 0.95rem;
            color: #5c556b;
            line-height: 1.5;
            margin-bottom: 26px;
        }

        .btn-modal-done {
            display: inline-block;
            width: 100%;
            padding: 13px;
            border-radius: 12px;
            background-color: var(--brand-purple);
            color: #ffffff;
            font-size: 1rem;
            font-weight: 700;
            text-decoration: none;
            box-shadow: 0 4px 14px rgba(88, 50, 150, 0.3);
            transition: background 0.15s;
        }

        .btn-modal-done:hover {
            background-color: #432177;
        }

        /* Responsive Breakpoints */
        @media (max-width: 1024px) {
            .category-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }

        @media (max-width: 768px) {
            .topbar-header {
                padding: 0 20px;
            }
            .stepper-section {
                padding: 12px 20px;
                overflow-x: auto;
            }
            .category-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .fields-grid-2, .disbursement-row, .review-hero, .review-meta-grid {
                grid-template-columns: 1fr;
            }
            .photo-gallery-layout {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

    <!-- TOPBAR HEADER -->
    <header class="topbar-header">
        <div class="header-left">
            <a href="{{ route('manajemen-kampanye') }}" class="brand-link">
                <div class="brand-logo-badge">
                    <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
                </div>
                <div class="brand-text-block">
                    <span class="brand-name">Benevo<span class="brand-yellow-dot"></span></span>
                    <span class="brand-sub">CMS PLATFORM</span>
                </div>
            </a>

            <span class="breadcrumb-sep">&rsaquo;</span>
            <a href="{{ route('operator.dashboard') }}" class="breadcrumb-link">Menu Utama</a>
            <span class="breadcrumb-sep">&rsaquo;</span>
            <span class="breadcrumb-current">Buat Kampanye</span>
        </div>

        <div class="header-right">
            <div class="avatar-circle">
                <!-- Illustrated Avatar -->
                <svg viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <circle cx="18" cy="18" r="18" fill="#e9dbcb"/>
                    <path d="M18 19c3.31 0 6-2.69 6-6s-2.69-6-6-6-6 2.69-6 6 2.69 6 6 6z" fill="#3b2b23"/>
                    <circle cx="18" cy="14" r="4.2" fill="#eac6a6"/>
                    <path d="M14 11.5c1-1 3-1.5 4-1.5s3 .5 4 1.5c0-1.5-1.5-2.5-4-2.5s-4 1-4 2.5z" fill="#2b1f19"/>
                    <path d="M7.5 32c1.8-6 5.5-8 10.5-8s8.7 2 10.5 8" fill="#588157"/>
                    <path d="M15.5 24l2.5 3 2.5-3" stroke="#ffffff" stroke-width="1.2"/>
                </svg>
            </div>
        </div>
    </header>

    <!-- STEPPER NAVIGATION -->
    <section class="stepper-section">
        <div class="stepper-container">
            <!-- Step 1 -->
            <div class="step-item active" id="stepIndicator1" onclick="goToStep(1)">
                <div class="step-circle" id="circle1">1</div>
                <span class="step-label">Pilih Kategori</span>
            </div>

            <span class="step-divider">&rsaquo;</span>

            <!-- Step 2 -->
            <div class="step-item" id="stepIndicator2" onclick="goToStep(2)">
                <div class="step-circle" id="circle2">2</div>
                <span class="step-label">Detail &amp; Dana</span>
            </div>

            <span class="step-divider">&rsaquo;</span>

            <!-- Step 3 -->
            <div class="step-item" id="stepIndicator3" onclick="goToStep(3)">
                <div class="step-circle" id="circle3">3</div>
                <span class="step-label">Dokumen Legalitas</span>
            </div>

            <span class="step-divider">&rsaquo;</span>

            <!-- Step 4 -->
            <div class="step-item" id="stepIndicator4" onclick="goToStep(4)">
                <div class="step-circle" id="circle4">4</div>
                <span class="step-label">Review dan Publikasi</span>
            </div>
        </div>
    </section>

    <!-- MAIN FORM CONTAINER -->
    <main class="main-content">

        <!-- ======================= STEP 1: PILIH KATEGORI ======================= -->
        <div id="stepView1" class="step-view">
            <div class="page-intro">
                <h1 class="page-title">Tentukan Kategori Penggalangan Dana</h1>
                <p class="page-subtitle">
                    Pilih salah satu dari 12 kategori program yang paling sesuai dengan target inisiatif Anda. Bidang formulir dan persyaratan dokumen pada langkah berikutnya akan menyesuaikan secara otomatis.
                </p>
            </div>

            <!-- 12 Category Grid Cards -->
            <div class="category-grid" style="margin-top: 24px;">
                <!-- 1. Bencana Alam -->
                <div class="category-card" onclick="selectCategory('Bencana Alam', this)">
                    <div class="category-icon-box">🌋</div>
                    <h3 class="category-card-title">Bencana Alam</h3>
                    <p class="category-card-desc">Tanggap darurat gempa, banjir, erupsi dan bantuan tanda logistik</p>
                </div>

                <!-- 2. Balita dan Anak Sakit -->
                <div class="category-card" onclick="selectCategory('Balita dan Anak Sakit', this)">
                    <span class="category-badge-plus">+</span>
                    <div class="category-icon-box">👶</div>
                    <h3 class="category-card-title">Balita dan Anak Sakit</h3>
                    <p class="category-card-desc">perawatan intensif PICU/NICU kelainan kongenital, &amp; gizi.</p>
                </div>

                <!-- 3. Bantuan Medis (Default selected) -->
                <div class="category-card selected" onclick="selectCategory('Bantuan Medis', this)">
                    <span class="category-badge-plus">+</span>
                    <div class="category-icon-box">🩺</div>
                    <h3 class="category-card-title">Bantuan Medis</h3>
                    <p class="category-card-desc">Operasi, Pembedahan, terapi penyakit kristis, &amp; obat-obatan penunjang.</p>
                </div>

                <!-- 4. Bantuan Pendidikan -->
                <div class="category-card" onclick="selectCategory('Bantuan Pendidikan', this)">
                    <div class="category-icon-box">🎓</div>
                    <h3 class="category-card-title">Bantuan Pendidikan</h3>
                    <p class="category-card-desc">Beasiswa siswa prasejahtera, seragam, &amp; sarana belajar</p>
                </div>

                <!-- 5. Lingkungan -->
                <div class="category-card" onclick="selectCategory('Lingkungan', this)">
                    <div class="category-icon-box">🌱</div>
                    <h3 class="category-card-title">Lingkungan</h3>
                    <p class="category-card-desc">Konservasi hujan, reboisasi mangrove, &amp; pembersihan laut</p>
                </div>

                <!-- 6. Kegiatan Sosial -->
                <div class="category-card" onclick="selectCategory('Kegiatan Sosial', this)">
                    <div class="category-icon-box">🍱</div>
                    <h3 class="category-card-title">Kegiatan Sosial</h3>
                    <p class="category-card-desc">Dapur umum, santunan lansia, &amp; pemberdayaan marjinal.</p>
                </div>

                <!-- 7. Infrastruktur Umum -->
                <div class="category-card" onclick="selectCategory('Infrastruktur Umum', this)">
                    <div class="category-icon-box">🏗️</div>
                    <h3 class="category-card-title">Infrastruktur Umum</h3>
                    <p class="category-card-desc">Jembatan, Jalan Rusak, sumur air bersih &amp; listrik desa terpencil.</p>
                </div>

                <!-- 8. Karya Kreatif & Usaha -->
                <div class="category-card" onclick="selectCategory('Karya Kreatif & Usaha', this)">
                    <div class="category-icon-box">💡</div>
                    <h3 class="category-card-title">Karya Kreatif &amp; Usaha</h3>
                    <p class="category-card-desc">Usaha UMKM, dan pameran publik, ataupun aksi dalam masyarakat.</p>
                </div>

                <!-- 9. Panti Asuhan -->
                <div class="category-card" onclick="selectCategory('Panti Asuhan', this)">
                    <div class="category-icon-box">🏡</div>
                    <h3 class="category-card-title">Panti Asuhan</h3>
                    <p class="category-card-desc">Operasi tempat tinggal, renovasi, kegiatan dan nutrisi</p>
                </div>

                <!-- 10. Tempat Ibadah -->
                <div class="category-card" onclick="selectCategory('Tempat Ibadah', this)">
                    <div class="category-icon-box">🕌</div>
                    <h3 class="category-card-title">Tempat Ibadah</h3>
                    <p class="category-card-desc">Renovasi ataupun pembangunan tempat beribadah semua umat beragama</p>
                </div>

                <!-- 11. Menolong hewan -->
                <div class="category-card" onclick="selectCategory('Menolong hewan', this)">
                    <div class="category-icon-box">🐾</div>
                    <h3 class="category-card-title">Menolong hewan</h3>
                    <p class="category-card-desc">Penyelamatan satwa terlantar, pakan shelter, &amp; sterilisasi.</p>
                </div>

                <!-- 12. Difabel & Disabilitas -->
                <div class="category-card" onclick="selectCategory('Difabel & Disabilitas', this)">
                    <div class="category-icon-box">♿</div>
                    <h3 class="category-card-title">Karya Kreatif &amp; Usaha</h3>
                    <p class="category-card-desc">Usaha UMKM, dan pameran publik, ataupun aksi dalam masyarakat.</p>
                </div>
            </div>

            <!-- Purple warning notice banner -->
            <div class="warning-notice-banner" style="margin-top: 24px;">
                <span class="warning-icon">&#9888;</span>
                <span>Kategori Bantuan Medis dan Balita Sakit memerlukan berkas rekam medis dan verifikasi faskes resmi pada langkah berikutnya.</span>
            </div>

            <!-- Bottom Action Navigation -->
            <div class="bottom-nav-bar" style="margin-top: 30px;">
                <a href="{{ route('manajemen-kampanye') }}" class="btn-nav-back">
                    &larr; Kembali Ke Manajemen Kampanye
                </a>
                <button type="button" class="btn-nav-next" onclick="goToStep(2)">
                    <span>Lanjut ke Detail &amp; Dana</span>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                        <polyline points="12 5 19 12 12 19"></polyline>
                    </svg>
                </button>
            </div>
        </div>

        <!-- ======================= STEP 2: DETAIL & DANA ======================= -->
        <div id="stepView2" class="step-view" style="display: none;">
            <!-- Category Banner -->
            <div class="category-selected-banner">
                <div>
                    🩺 Kategori Terpilih: <strong id="selectedCategoryLabel">Bantuan Medis</strong> - 
                    <a onclick="goToStep(1)">Ubah Kategori</a>
                </div>
            </div>

            <!-- Card 1: Informasi Dasar Kampanye -->
            <div class="form-section-card">
                <div class="section-header">
                    <span class="section-num-badge">1</span>
                    <div class="section-titles">
                        <h2 class="section-main-title">Informasi Dasar Kampanye</h2>
                        <span class="section-sub-title">Tentukan identitas utama, durasi, target pelanggan, dan media visual representatif.</span>
                    </div>
                </div>

                <div class="fields-grid-2">
                    <div class="form-field-group">
                        <label class="form-label">Judul Kampanye<span class="required-star">*</span></label>
                        <input type="text" class="input-box" id="inputJudul" value="Bantuan Operasi Kanker Pak Anton" placeholder="Minimal 15 Karakter">
                    </div>
                    <div class="form-field-group">
                        <label class="form-label">Nama Penggalang Dana<span class="required-star">*</span></label>
                        <input type="text" class="input-box" id="inputPenggalang" value="Harelyn Laluan Madani" placeholder="Minimal 5 Karakter">
                    </div>
                </div>

                <div class="fields-grid-2">
                    <div class="form-field-group">
                        <label class="form-label">Target Kebutuhan Dana Donasi<span class="required-star">*</span></label>
                        <input type="text" class="input-box" id="inputTarget" value="Rp 85.000.000" placeholder="Masukkan Nominal">
                    </div>
                    <div class="form-field-group">
                        <label class="form-label">Tanggal Penggalangan Dana<span class="required-star">*</span></label>
                        <div class="date-range-wrap">
                            <div class="input-with-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                                <input type="text" value="20 Okt 2026">
                            </div>
                            <div class="input-with-icon">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                                <input type="text" value="27 Okt 2026">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-field-group">
                    <label class="form-label">Lokasi Pelaksanaan / Domisili Medis<span class="required-star">*</span></label>
                    <div class="input-with-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"/><circle cx="12" cy="10" r="3"/></svg>
                        <input type="text" id="inputLokasi" value="Kepulauan Riau - Kota Batam" placeholder="Pilih Lokasi">
                    </div>
                    <span class="field-subtext">Isi dengan nama provinsi - Kabupaten/ Kota</span>
                </div>

                <div class="form-field-group">
                    <label class="form-label">Foto Utama dan Kondisi Medis<span class="required-star">*</span></label>
                    <div class="photo-gallery-layout">
                        <!-- Main Photo -->
                        <div class="main-photo-preview">
                            <img src="https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&w=600&q=80" alt="Foto Pasien di Rumah Sakit">
                        </div>
                        <!-- Sub Photos 2x2 -->
                        <div class="sub-photos-grid">
                            <div class="sub-photo-box">
                                <img src="https://images.unsplash.com/photo-1584515979956-d9f6e5d09982?auto=format&fit=crop&w=300&q=80" alt="Kondisi Pasien 1">
                            </div>
                            <div class="sub-photo-box">
                                <img src="https://images.unsplash.com/photo-1584515979956-d9f6e5d09982?auto=format&fit=crop&w=300&q=80" alt="Kondisi Pasien 2">
                            </div>
                            <div class="sub-photo-box">
                                <img src="https://images.unsplash.com/photo-1579684385127-1ef15d508118?auto=format&fit=crop&w=300&q=80" alt="Kondisi Pasien 3">
                            </div>
                            <div class="upload-slot-btn" onclick="alert('Pilih gambar baru untuk diunggah ke galeri kampanye.')" title="Tambah Foto">
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><rect x="3" y="3" width="18" height="18" rx="2"/><circle cx="8.5" cy="8.5" r="1.5"/><polyline points="21 15 16 10 5 21"/></svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Card 2: Data Penerima Manfaat -->
            <div class="form-section-card">
                <div class="section-header">
                    <span class="section-num-badge">2</span>
                    <div class="section-titles">
                        <h2 class="section-main-title">Data Penerima Manfaat</h2>
                        <span class="section-sub-title">Informasi identitas klinis pasien untuk keperluan verifikasi berkas medis RS.</span>
                    </div>
                </div>

                <div class="fields-grid-2">
                    <div class="form-field-group">
                        <label class="form-label">Nama lengkap Pasien<span class="required-star">*</span></label>
                        <input type="text" class="input-box" id="inputPasien" value="Antoni NasiPad" placeholder="Nama Lengkap">
                    </div>
                    <div class="form-field-group">
                        <label class="form-label">Hubungan dengan Penggalang Dana<span class="required-star">*</span></label>
                        <input type="text" class="input-box" value="Tetangga Perumahan" placeholder="Anda sebagai siapa">
                    </div>
                </div>

                <div class="form-field-group">
                    <label class="form-label">Rumah Sakit / Faskes Rujukan Perawatan<span class="required-star">*</span></label>
                    <div class="input-with-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M3 21h18M5 21V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2v16M9 9h6M12 6v6"/></svg>
                        <input type="text" id="inputRS" value="Rs Awal Bros, Kota Batam" placeholder="Masukkan Nama Rumah Sakit">
                    </div>
                </div>

                <div class="form-field-group">
                    <label class="form-label">Diagnosis Medis Singkat</label>
                    <input type="text" class="input-box" value="Tetralogy of Fallot (Kelainan Jantung Bawaan Sianotik) - Memerlukan Operasi Rekonstruksi &amp; Kateterisasi Jantung Segera" placeholder="Penjelasan medis Ringkas">
                </div>
            </div>

            <!-- Card 3: Narasi Penggalangan Donasi -->
            <div class="form-section-card">
                <div class="section-header">
                    <span class="section-num-badge">3</span>
                    <div class="section-titles">
                        <h2 class="section-main-title">Narasi Penggalangan Donasi</h2>
                        <span class="section-sub-title">Sampaikan kondisi pasien secara jujur, menyentuh hati, dan transparan bagi para donatur.</span>
                    </div>
                </div>

                <div class="form-field-group">
                    <div class="rich-toolbar">
                        <div class="rich-tools-left">
                            <button type="button" class="toolbar-btn">B</button>
                            <button type="button" class="toolbar-btn">I</button>
                            <button type="button" class="toolbar-btn">S</button>
                            <button type="button" class="toolbar-btn">&equiv;</button>
                            <button type="button" class="toolbar-btn">99</button>
                            <button type="button" class="toolbar-btn">&#128279;</button>
                            <span class="toolbar-notice">Tulis Minimal 200 kata untuk peluang verifikasi lebih cepat.</span>
                        </div>
                        <button type="button" class="btn-toolbar-save">Simpan</button>
                    </div>
                    <textarea class="rich-textarea" id="inputNarasi" oninput="updateCharCount(this)">Pak Anton adalah sosok kepala keluarga tangguh yang selama ini bekerja sebagai buruh harian. Tiga bulan lalu beliau didiagnosis menderita kanker stadium lanjut yang memerlukan tindakan operasi rekonstruksi dan kemoterapi intensif sesegera mungkin di RS Awal Bros Batam. Tanpa bantuan uluran tangan kita bersama, biaya operasi ini terlalu berat dipikul oleh keluarga kecil beliau.</textarea>
                    <div class="char-counter" id="charCounter">348/1000</div>
                </div>
            </div>

            <!-- Card 4: Rencana Anggaran Biaya -->
            <div class="form-section-card">
                <div class="budget-header-row">
                    <div class="section-header">
                        <span class="section-num-badge">4</span>
                        <div class="section-titles">
                            <h2 class="section-main-title">Rencana Anggaran Biaya</h2>
                            <span class="section-sub-title">Sampaikan rincian alokasi dana secara jujur, transparan, dan terukur.</span>
                        </div>
                    </div>
                    <button type="button" class="btn-add-budget" onclick="addBudgetItem()" title="Tambah Rincian Anggaran">+</button>
                </div>

                <!-- Budget items list -->
                <div class="budget-items-list" id="budgetItemsList">
                    <!-- Item 1 -->
                    <div class="budget-item-row" id="rowBudget1">
                        <input type="text" class="input-box" value="Pengeluaran #1: Tindakan Operasi dan Bedah Kanker">
                        <input type="text" class="input-box budget-amt" value="52000000" oninput="recalcBudget()">
                        <button type="button" class="btn-delete-row" onclick="removeBudgetItem('rowBudget1')" title="Hapus Item">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg>
                        </button>
                    </div>

                    <!-- Item 2 -->
                    <div class="budget-item-row" id="rowBudget2">
                        <input type="text" class="input-box" value="Pengeluaran #2: Rawat Intensif PICU (14 Hari) &amp; Obat Khusus">
                        <input type="text" class="input-box budget-amt" value="24500000" oninput="recalcBudget()">
                        <button type="button" class="btn-delete-row" onclick="removeBudgetItem('rowBudget2')" title="Hapus Item">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg>
                        </button>
                    </div>

                    <!-- Item 3 -->
                    <div class="budget-item-row" id="rowBudget3">
                        <input type="text" class="input-box" value="Pengeluaran #3: Biaya Operasional Kendaraan, Keluarga, Penunjang Medis lainnya.">
                        <input type="text" class="input-box budget-amt" value="8500000" oninput="recalcBudget()">
                        <button type="button" class="btn-delete-row" onclick="removeBudgetItem('rowBudget3')" title="Hapus Item">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg>
                        </button>
                    </div>
                </div>

                <!-- Disbursement info -->
                <div class="disbursement-row">
                    <div class="form-field-group">
                        <label class="form-label">Metode Pencairan Dana</label>
                        <select class="input-box" style="cursor: pointer;">
                            <option value="BCA">BCA (Bank Central Asia)</option>
                            <option value="Mandiri">Bank Mandiri</option>
                            <option value="BNI">BNI (Bank Negara Indonesia)</option>
                            <option value="BRI">BRI (Bank Rakyat Indonesia)</option>
                        </select>
                    </div>
                    <div class="form-field-group">
                        <label class="form-label">Nama Pemilik Rekening</label>
                        <input type="text" class="input-box" value="Harelyn Laluan Madani">
                    </div>
                </div>

                <!-- Total Row -->
                <div class="budget-total-box">
                    <span class="budget-total-title">Total Akumulasi Rencana Anggaran Biaya</span>
                    <span class="budget-total-value" id="displayTotalBudget">Rp 85.000.000</span>
                </div>
            </div>

            <!-- Bottom Action Navigation -->
            <div class="bottom-nav-bar">
                <button type="button" class="btn-nav-back" onclick="goToStep(1)">
                    &larr; Kembali Ke Pilih Kategori
                </button>
                <button type="button" class="btn-nav-next" onclick="goToStep(3)">
                    <span>Lanjut ke Dokumen Legalitas</span>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                        <polyline points="12 5 19 12 12 19"></polyline>
                    </svg>
                </button>
            </div>
        </div>

        <!-- ======================= STEP 3: DOKUMEN LEGALITAS ======================= -->
        <div id="stepView3" class="step-view" style="display: none;">
            <!-- Privacy Lock Banner -->
            <div class="privacy-banner">
                <svg viewBox="0 0 24 24" fill="none" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect>
                    <path d="M7 11V7a5 5 0 0 1 10 0v4"></path>
                </svg>
                <span>Dokumen di langkah ini bersifat rahasia. Hanya Admin dan Anda yang bisa melihatnya, dan tidak tampil di halaman publik.</span>
            </div>

            <!-- Dokumen wajib header & progress -->
            <div class="documents-header-row">
                <h2 class="page-title" style="font-size: 1.45rem;">Dokumen wajib</h2>
                <span class="docs-progress-text">2 dari 3 terunggah</span>
            </div>

            <!-- Upload Cards List -->
            <div class="doc-cards-list">
                <!-- Card 1: Surat Diagnosis -->
                <div class="doc-upload-card">
                    <div>
                        <h3 class="doc-card-title">Surat diagnosis atau rekam medis<span class="required-star">*</span></h3>
                        <p class="doc-card-desc">Dari dokter atau rumah sakit. PDF, JPG, atau PNG, maksimal 2 MB.</p>
                    </div>
                    <div class="doc-chips-row">
                        <div class="doc-file-chip">
                            <button type="button" class="doc-chip-close" onclick="this.parentElement.remove()">&times;</button>
                            <svg viewBox="0 0 24 24" fill="none" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                            <span>Surat_Di...</span>
                        </div>
                        <div class="doc-file-chip">
                            <button type="button" class="doc-chip-close" onclick="this.parentElement.remove()">&times;</button>
                            <svg viewBox="0 0 24 24" fill="none" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                            <span>Surat_Re...</span>
                        </div>
                        <div class="doc-add-slot" onclick="alert('Pilih file berkas diagnosis untuk diunggah.')" title="Unggah Berkas Baru">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="12" y1="18" x2="12" y2="12"/><line x1="9" y1="15" x2="15" y2="15"/></svg>
                        </div>
                    </div>
                </div>

                <!-- Card 2: Rincian Estimasi Biaya -->
                <div class="doc-upload-card">
                    <div>
                        <h3 class="doc-card-title">Rincian estimasi biaya rumah sakit<span class="required-star">*</span></h3>
                        <p class="doc-card-desc">Rincian biaya operasi, rawat inap, dan obat. Total harus sesuai RAB.</p>
                    </div>
                    <div class="doc-chips-row">
                        <div class="doc-file-chip">
                            <button type="button" class="doc-chip-close" onclick="this.parentElement.remove()">&times;</button>
                            <svg viewBox="0 0 24 24" fill="none" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                            <span>Surat_Di...</span>
                        </div>
                        <div class="doc-file-chip">
                            <button type="button" class="doc-chip-close" onclick="this.parentElement.remove()">&times;</button>
                            <svg viewBox="0 0 24 24" fill="none" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/></svg>
                            <span>Surat_Re...</span>
                        </div>
                        <div class="doc-add-slot" onclick="alert('Pilih file rincian biaya RS untuk diunggah.')" title="Unggah Berkas Baru">
                            <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="12" y1="18" x2="12" y2="12"/><line x1="9" y1="15" x2="15" y2="15"/></svg>
                        </div>
                    </div>
                </div>

                <!-- Card 3: KTP dan KK -->
                <div class="doc-upload-card">
                    <div>
                        <h3 class="doc-card-title">KTP dan KK Penanggung Jawab<span class="required-star">*</span></h3>
                        <p class="doc-card-desc">Foto jelas, tidak buram, semua data terbaca.</p>
                    </div>
                    <div class="dropzone-box" onclick="simulateFileUpload(this, 'KTP_PenanggungJawab.jpg')">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
                        <span class="dropzone-text">Tarik file ke sini atau <strong>pilih file</strong></span>
                    </div>
                </div>

                <!-- Card 4: Dokumen Tambahan -->
                <div class="doc-upload-card">
                    <div>
                        <h3 class="doc-card-title">Dokumen Tambahan (Surat rujukan, Kartu BPJS)<span class="required-star">*</span></h3>
                        <p class="doc-card-desc">Foto jelas, tidak buram, semua data terbaca.</p>
                    </div>
                    <div class="dropzone-box" onclick="simulateFileUpload(this, 'Kartu_BPJS_Pasien.pdf')">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"/><polyline points="17 8 12 3 7 8"/><line x1="12" y1="3" x2="12" y2="15"/></svg>
                        <span class="dropzone-text">Tarik file ke sini atau <strong>pilih file</strong></span>
                    </div>
                </div>
            </div>

            <!-- Bottom Action Navigation -->
            <div class="bottom-nav-bar">
                <button type="button" class="btn-nav-back" onclick="goToStep(2)">
                    &larr; Kembali Ke Detail &amp; Dana
                </button>
                <button type="button" class="btn-nav-next" onclick="goToStep(4)">
                    <span>Lanjut ke Review dan Publikasi</span>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                        <line x1="5" y1="12" x2="19" y2="12"></line>
                        <polyline points="12 5 19 12 12 19"></polyline>
                    </svg>
                </button>
            </div>
        </div>

        <!-- ======================= STEP 4: REVIEW DAN PUBLIKASI ======================= -->
        <div id="stepView4" class="step-view" style="display: none;">
            <div class="page-intro">
                <h1 class="page-title">Review &amp; Publikasi Kampanye</h1>
                <p class="page-subtitle">
                    Pastikan seluruh informasi medis, target kebutuhan dana donasi, dan berkas verifikasi legalitas sudah sesuai sebelum dikirim ke tim kurasi Benevo.
                </p>
            </div>

            <!-- Preview Card -->
            <div class="review-preview-card">
                <div class="review-hero">
                    <img src="https://images.unsplash.com/photo-1519494026892-80bbd2d6fd0d?auto=format&fit=crop&w=600&q=80" alt="Preview Foto" class="review-hero-img">
                    <div class="review-hero-info">
                        <span class="review-category-badge" id="reviewCategoryBadge">Bantuan Medis</span>
                        <h2 class="review-title" id="reviewTitle">Bantuan Operasi Kanker Pak Anton</h2>
                        <span style="font-size: 0.88rem; color: #6e677c;">Target Kebutuhan Dana:</span>
                        <div class="review-target-amount" id="reviewTargetAmount">Rp 85.000.000</div>
                    </div>
                </div>

                <div class="review-meta-grid">
                    <div class="review-meta-item">
                        <span class="review-meta-label">Nama Penggalang</span>
                        <span class="review-meta-val" id="reviewPenggalang">Harelyn Laluan Madani</span>
                    </div>
                    <div class="review-meta-item">
                        <span class="review-meta-label">Nama Pasien</span>
                        <span class="review-meta-val" id="reviewPasien">Antoni NasiPad</span>
                    </div>
                    <div class="review-meta-item">
                        <span class="review-meta-label">Rumah Sakit / Lokasi</span>
                        <span class="review-meta-val" id="reviewRS">Rs Awal Bros, Kota Batam</span>
                    </div>
                </div>

                <div style="background-color: #faf7fd; border-radius: 12px; padding: 18px 20px; border: 1px solid #ede4f7;">
                    <h4 style="font-size: 0.95rem; font-weight: 800; color: #3b2260; margin-bottom: 8px;">Ringkasan Narasi</h4>
                    <p style="font-size: 0.88rem; color: #5a5266; line-height: 1.55;" id="reviewNarasi">
                        Pak Anton adalah sosok kepala keluarga tangguh yang selama ini bekerja sebagai buruh harian. Tiga bulan lalu beliau didiagnosis menderita kanker stadium lanjut yang memerlukan tindakan operasi rekonstruksi dan kemoterapi intensif sesegera mungkin di RS Awal Bros Batam.
                    </p>
                </div>

                <!-- Terms agreement -->
                <label class="agreement-box">
                    <input type="checkbox" class="agreement-checkbox" checked id="termsAgreeCheck">
                    <span class="agreement-text">
                        Saya menyatakan dengan sungguh-sungguh bahwa seluruh informasi, identitas medis, rencana anggaran, dan dokumen yang diunggah adalah sah, akurat, dan dapat dipertanggungjawabkan sesuai hukum yang berlaku.
                    </span>
                </label>
            </div>

            <!-- Bottom Action Navigation -->
            <div class="bottom-nav-bar">
                <button type="button" class="btn-nav-back" onclick="goToStep(3)">
                    &larr; Kembali Ke Dokumen Legalitas
                </button>
                <button type="button" class="btn-nav-next" style="background-color: #199447;" onclick="submitCampaign()">
                    <span>Publikasikan Kampanye</span>
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                        <polyline points="20 6 9 17 4 12"></polyline>
                    </svg>
                </button>
            </div>
        </div>

    </main>

    <!-- SUCCESS MODAL POPUP -->
    <div class="modal-backdrop" id="successModal">
        <div class="modal-card">
            <div class="modal-icon-congrats">&check;</div>
            <h3 class="modal-title">Kampanye Berhasil Diajukan!</h3>
            <p class="modal-text">
                Penggalangan dana Anda telah masuk ke sistem Benevo dan dalam tahap verifikasi kurasi. Tim kami akan menginformasikan update status dalam waktu maksimal 1x24 jam.
            </p>
            <a href="{{ route('manajemen-kampanye') }}" class="btn-modal-done">
                Lihat di Manajemen Kampanye
            </a>
        </div>
    </div>

    <!-- JAVASCRIPT LOGIC -->
    <script>
        let currentStep = 1;
        let selectedCategory = 'Bantuan Medis';

        function selectCategory(categoryName, element) {
            selectedCategory = categoryName;
            document.querySelectorAll('.category-card').forEach(card => card.classList.remove('selected'));
            element.classList.add('selected');
            document.getElementById('selectedCategoryLabel').textContent = categoryName;
            document.getElementById('reviewCategoryBadge').textContent = categoryName;
        }

        function goToStep(step) {
            currentStep = step;

            // Hide all step views
            for (let i = 1; i <= 4; i++) {
                const view = document.getElementById('stepView' + i);
                const indicator = document.getElementById('stepIndicator' + i);
                const circle = document.getElementById('circle' + i);

                if (view) view.style.display = (i === step) ? 'block' : 'none';

                if (indicator) {
                    indicator.classList.remove('active', 'completed');
                    if (i < step) {
                        indicator.classList.add('completed');
                        circle.innerHTML = '&check;';
                    } else if (i === step) {
                        indicator.classList.add('active');
                        circle.textContent = i;
                    } else {
                        circle.textContent = i;
                    }
                }
            }

            // Sync Step 4 values if jumping to Step 4
            if (step === 4) {
                document.getElementById('reviewTitle').textContent = document.getElementById('inputJudul').value || 'Bantuan Operasi Kanker Pak Anton';
                document.getElementById('reviewPenggalang').textContent = document.getElementById('inputPenggalang').value || 'Harelyn Laluan Madani';
                document.getElementById('reviewTargetAmount').textContent = document.getElementById('inputTarget').value || 'Rp 85.000.000';
                document.getElementById('reviewPasien').textContent = document.getElementById('inputPasien').value || 'Antoni NasiPad';
                document.getElementById('reviewRS').textContent = document.getElementById('inputRS').value || 'Rs Awal Bros, Kota Batam';
                document.getElementById('reviewNarasi').textContent = document.getElementById('inputNarasi').value || 'Narasi penggalangan dana.';
            }

            // Smooth scroll to top of content
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        function updateCharCount(textarea) {
            const count = textarea.value.length;
            document.getElementById('charCounter').textContent = count + '/1000';
        }

        let budgetCount = 3;
        function addBudgetItem() {
            budgetCount++;
            const list = document.getElementById('budgetItemsList');
            const newRow = document.createElement('div');
            newRow.className = 'budget-item-row';
            newRow.id = 'rowBudget' + budgetCount;
            newRow.innerHTML = `
                <input type="text" class="input-box" value="Pengeluaran #${budgetCount}: Rincian Kebutuhan Baru" placeholder="Nama kebutuhan">
                <input type="text" class="input-box budget-amt" value="5000000" oninput="recalcBudget()">
                <button type="button" class="btn-delete-row" onclick="removeBudgetItem('rowBudget${budgetCount}')" title="Hapus Item">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><polyline points="3 6 5 6 21 6"/><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"/></svg>
                </button>
            `;
            list.appendChild(newRow);
            recalcBudget();
        }

        function removeBudgetItem(rowId) {
            const row = document.getElementById(rowId);
            if (row) {
                row.remove();
                recalcBudget();
            }
        }

        function recalcBudget() {
            let total = 0;
            document.querySelectorAll('.budget-amt').forEach(input => {
                const clean = input.value.replace(/[^0-9]/g, '');
                const num = parseInt(clean, 10) || 0;
                total += num;
            });
            const formatted = 'Rp ' + total.toLocaleString('id-ID');
            document.getElementById('displayTotalBudget').textContent = formatted;
            document.getElementById('inputTarget').value = formatted;
        }

        function simulateFileUpload(dropzone, filename) {
            dropzone.innerHTML = `
                <div style="display:flex; align-items:center; gap:10px; color:#199447; font-weight:700; font-size:0.95rem;">
                    <span>&check;</span>
                    <span>${filename} (Berhasil diunggah)</span>
                </div>
            `;
            dropzone.style.borderColor = '#199447';
            dropzone.style.backgroundColor = '#ecfdf5';
        }

        function submitCampaign() {
            const modal = document.getElementById('successModal');
            if (modal) {
                modal.classList.add('show');
            }
        }
    </script>
</body>
</html>
