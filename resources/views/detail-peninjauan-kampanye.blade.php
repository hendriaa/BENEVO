<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Peninjauan Kampanye</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root {
            --bg-page: #f2ecfa;
            --bg-sidebar: #ffffff;
            --bg-card: #ffffff;
            --brand-purple: #855cb8;
            --brand-purple-heading: #2d174e;
            --brand-text-dark: #1f1b26;
            --brand-text-muted: #6e727e;
            --brand-border: #e9e2f5;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background-color: var(--bg-page);
            color: var(--brand-text-dark);
            min-height: 100vh;
            display: flex;
            -webkit-font-smoothing: antialiased;
        }

        .app-wrapper {
            display: flex;
            width: 100vw;
            min-height: 100vh;
            overflow: hidden;
        }

        /* ========== SIDEBAR ========== */
        .sidebar {
            width: 275px;
            max-width: 275px;
            background-color: var(--bg-sidebar);
            border-right: 1px solid var(--brand-border);
            display: flex;
            flex-direction: column;
            padding: 24px 16px;
            flex-shrink: 0;
            min-height: 100vh;
            height: 100vh;
            position: sticky;
            top: 0;
            align-self: flex-start;
            overflow-y: auto;
            z-index: 100;
        }

        .sidebar-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
        }

        .brand-logo-badge {
            width: 38px;
            height: 38px;
            background: transparent;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            overflow: hidden;
        }

        .brand-logo-badge img {
            width: 100%;
            height: 100%;
            display: block;
            object-fit: contain;
        }

        .brand-text-block {
            display: flex;
            flex-direction: column;
            line-height: 1;
        }

        .brand-wordmark-wrap {
            position: relative;
            display: inline-flex;
            align-items: center;
        }

        .brand-wordmark {
            font-size: 2.1rem;
            font-weight: 800;
            letter-spacing: -0.06em;
            line-height: 0.9;
        }

        .brand-gradient {
            background: linear-gradient(90deg, #6d3ca1 0%, #8e6bc6 40%, #c9a227 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .brand-yellow-dot {
            position: absolute;
            right: -8px;
            top: 5px;
            width: 9px;
            height: 9px;
            background-color: #f4d566;
            border-radius: 50%;
        }

        .brand-platform-sub {
            font-size: 0.62rem;
            font-weight: 800;
            letter-spacing: 0.12em;
            color: #7c5a9f;
            margin-top: 2px;
            text-transform: uppercase;
        }

        .mode-banner {
            margin-top: 24px;
            background-color: #f0e8fc;
            border-radius: 10px;
            padding: 10px 12px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .mode-left {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .mode-dot {
            width: 9px;
            height: 9px;
            background-color: #6a3ab2;
            border-radius: 50%;
        }

        .mode-title {
            font-size: 0.85rem;
            font-weight: 700;
            color: #3b2260;
            line-height: 1.2;
        }

        .mode-sub {
            font-size: 0.73rem;
            color: #7d6b97;
            font-weight: 500;
        }

        .mode-badge {
            background-color: #fde8db;
            color: #cb5d2c;
            font-size: 0.68rem;
            font-weight: 700;
            padding: 2px 7px;
            border-radius: 5px;
        }

        .nav-section {
            margin-top: 24px;
        }

        .nav-section-title {
            font-size: 0.72rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: #8c829e;
            padding-left: 10px;
            margin-bottom: 8px;
        }

        .nav-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 10px 12px;
            border-radius: 10px;
            color: #4b3d60;
            text-decoration: none;
            font-size: 0.88rem;
            font-weight: 600;
            transition: all 0.15s ease;
        }

        .nav-link:hover {
            background-color: #f7f2fc;
            color: #2b1647;
        }

        .nav-link.active {
            background-color: #8254bc;
            color: #ffffff;
            box-shadow: 0 4px 12px rgba(130, 84, 188, 0.3);
        }

        .nav-link svg {
            width: 18px;
            height: 18px;
            fill: none;
            stroke: currentColor;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
            flex-shrink: 0;
        }

        .sidebar-footer {
            margin-top: auto;
            padding-top: 24px;
        }

        .logout-btn {
            display: flex;
            align-items: center;
            gap: 12px;
            background: none;
            border: none;
            cursor: pointer;
            padding: 10px 14px;
            border-radius: 10px;
            width: 100%;
            font-family: inherit;
            transition: all 0.2s ease;
            text-align: left;
        }

        .logout-btn:hover {
            background-color: #fff1f1;
        }

        .logout-btn svg {
            width: 20px;
            height: 20px;
            stroke: #1f1f1f;
            flex-shrink: 0;
            transition: stroke 0.2s;
        }

        .logout-btn span {
            font-size: 0.95rem;
            font-weight: 700;
            color: #db6e6e;
            transition: color 0.2s;
        }

        .logout-btn:hover svg {
            stroke: #d33838;
        }

        .logout-btn:hover span {
            color: #d33838;
        }

        /* ========== MAIN WRAPPER & TOPBAR ========== */
        .main-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            overflow-y: auto;
        }

        .topbar {
            background-color: var(--bg-card);
            border-bottom: 1px solid var(--brand-border);
            padding: 18px 36px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            position: sticky;
            top: 0;
            z-index: 90;
        }

        .search-container {
            display: flex;
            align-items: center;
            background-color: #f7f4fc;
            border: 1px solid #ebdff8;
            border-radius: 99px;
            padding: 8px 18px;
            width: 100%;
            max-width: 360px;
            gap: 10px;
        }

        .search-icon {
            display: flex;
            align-items: center;
            color: #8c829e;
        }

        .search-icon svg {
            width: 16px;
            height: 16px;
        }

        .search-input {
            border: none;
            background: transparent;
            outline: none;
            font-family: inherit;
            font-size: 0.85rem;
            color: var(--brand-text-dark);
            width: 100%;
        }

        .search-input::placeholder {
            color: #9f98ae;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .date-picker-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            background-color: #ffffff;
            border: 1px solid #e2d8f0;
            padding: 8px 14px;
            border-radius: 8px;
            font-size: 0.78rem;
            font-weight: 600;
            color: #433956;
            cursor: pointer;
            transition: all 0.15s;
        }

        .date-picker-btn svg {
            width: 15px;
            height: 15px;
        }

        .icon-action-btn {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            background: #ffffff;
            border: 1px solid #e2d8f0;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            position: relative;
            color: #55486d;
            transition: all 0.15s;
        }

        .icon-action-btn svg {
            width: 18px;
            height: 18px;
        }

        .notif-badge-dot {
            position: absolute;
            top: 7px;
            right: 7px;
            width: 7px;
            height: 7px;
            background-color: #e24b42;
            border-radius: 50%;
            border: 1.5px solid #ffffff;
        }

        .help-action-btn {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            background: #8b5fc2;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #ffffff;
            font-size: 0.95rem;
            font-weight: 700;
            transition: background 0.15s;
        }

        .profile-pill {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-left: 6px;
            cursor: pointer;
        }

        .profile-avatar {
            width: 38px;
            height: 38px;
            border-radius: 50%;
            background-color: #dfd2f5;
            object-fit: cover;
            border: 2px solid #ede4f8;
        }

        .profile-name {
            font-size: 0.86rem;
            font-weight: 700;
            color: #232227;
            line-height: 1.2;
        }

        .profile-role {
            font-size: 0.72rem;
            font-weight: 500;
            color: #797c88;
        }

        /* ========== CONTENT AREA (Images 4 & 5) ========== */
        .content-area {
            padding: 30px 36px 60px 36px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .back-nav-wrap {
            margin-bottom: -6px;
        }

        .back-nav-link {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: #794ea8;
            font-size: 0.88rem;
            font-weight: 700;
            text-decoration: none;
            transition: color 0.15s;
        }

        .back-nav-link:hover {
            color: #552d80;
            text-decoration: underline;
        }

        .page-title {
            font-size: 1.95rem;
            font-weight: 800;
            color: #2b1d4c;
            letter-spacing: -0.025em;
        }

        /* Review Card */
        .review-card {
            background-color: var(--bg-card);
            border-radius: 24px;
            padding: 36px 40px;
            box-shadow: 0 4px 20px rgba(90, 50, 140, 0.05);
            max-width: 880px;
            display: flex;
            flex-direction: column;
        }

        .review-card-title {
            font-size: 1.55rem;
            font-weight: 800;
            color: #2b1d4c;
            margin-bottom: 22px;
            letter-spacing: -0.02em;
        }

        .operator-box {
            background-color: #ebe2f8;
            border-radius: 12px;
            padding: 12px 20px;
            display: inline-flex;
            flex-direction: column;
            gap: 4px;
            align-self: flex-start;
            margin-bottom: 18px;
        }

        .operator-box-label {
            font-size: 0.82rem;
            color: #6d6282;
            font-weight: 500;
        }

        .operator-box-name {
            font-size: 1.15rem;
            font-weight: 800;
            color: #4b2679;
        }

        .detail-boxes-row {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-bottom: 22px;
            flex-wrap: wrap;
        }

        .detail-box {
            background-color: #ebe2f8;
            border-radius: 12px;
            padding: 12px 20px;
            display: flex;
            flex-direction: column;
            gap: 4px;
            min-width: 240px;
            flex: 1;
        }

        .detail-box-label {
            font-size: 0.8rem;
            color: #6d6282;
            font-weight: 500;
        }

        .detail-box-value {
            font-size: 1.15rem;
            font-weight: 800;
            color: #2b1d4c;
        }

        .field-label {
            font-size: 1rem;
            font-weight: 800;
            color: #2b1d4c;
            margin-bottom: 8px;
        }

        .field-label .req {
            color: #d93838;
        }

        .report-type-pill {
            background-color: #ebe2f8;
            border-radius: 12px;
            padding: 12px 20px;
            font-size: 0.96rem;
            font-weight: 600;
            color: #4b2679;
            display: inline-block;
            margin-bottom: 20px;
            align-self: flex-start;
        }

        .report-content-box {
            background-color: #ebe2f8;
            border-radius: 14px;
            padding: 18px 22px;
            font-size: 0.96rem;
            color: #4b2679;
            font-weight: 500;
            line-height: 1.5;
            min-height: 95px;
            margin-bottom: 24px;
        }

        .decision-textarea {
            width: 100%;
            min-height: 110px;
            border-radius: 14px;
            border: 1.5px solid #d5c8ed;
            background-color: #faf8fd;
            padding: 16px 18px;
            font-family: inherit;
            font-size: 0.95rem;
            color: #2a1e46;
            outline: none;
            resize: vertical;
            line-height: 1.45;
            transition: all 0.2s ease;
        }

        .decision-textarea:focus {
            border-color: #794ea8;
            background-color: #ffffff;
            box-shadow: 0 0 0 3px rgba(121, 78, 168, 0.15);
        }

        .decision-textarea::placeholder {
            color: #a49cb5;
        }

        .actions-row {
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 16px;
            margin-top: 32px;
        }

        .btn-abaikan {
            height: 50px;
            border-radius: 14px;
            border: 1.5px solid #8e909e;
            background-color: #ffffff;
            color: #2c2938;
            font-size: 1rem;
            font-weight: 700;
            padding: 0 36px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            cursor: pointer;
            transition: all 0.15s ease;
            font-family: inherit;
        }

        .btn-abaikan:hover {
            background-color: #f7f6f9;
            border-color: #555869;
        }

        .btn-bekukan-action {
            height: 50px;
            border-radius: 14px;
            border: none;
            background-color: #c42b2b;
            color: #ffffff;
            font-size: 1.02rem;
            font-weight: 700;
            padding: 0 32px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 4px 14px rgba(196, 43, 43, 0.35);
            transition: all 0.15s ease;
            font-family: inherit;
        }

        .btn-bekukan-action:hover {
            background-color: #a92020;
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(196, 43, 43, 0.45);
        }

        /* ========== CONFIRMATION MODAL POPUP (Image 5) ========== */
        .bekukan-modal-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(30, 20, 50, 0.45);
            backdrop-filter: blur(4px);
            -webkit-backdrop-filter: blur(4px);
            z-index: 99999;
            display: none;
            align-items: center;
            justify-content: center;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.25s ease;
        }

        .bekukan-modal-backdrop.show {
            display: flex !important;
            opacity: 1 !important;
            pointer-events: auto !important;
        }

        .bekukan-modal-card {
            background: #ffffff;
            width: 90%;
            max-width: 580px;
            border-radius: 28px;
            padding: 36px 38px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.22);
            display: flex;
            flex-direction: column;
            transform: scale(0.92);
            transition: transform 0.25s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .bekukan-modal-backdrop.show .bekukan-modal-card {
            transform: scale(1);
        }

        .bekukan-modal-title {
            font-size: 1.45rem;
            font-weight: 800;
            color: #2b1d4c;
            margin-bottom: 18px;
            letter-spacing: -0.02em;
        }

        .modal-campaign-box {
            background-color: #ebe2f8;
            border-radius: 12px;
            padding: 16px 20px;
            margin-bottom: 16px;
        }

        .modal-campaign-name {
            font-size: 1.15rem;
            font-weight: 800;
            color: #2b1d4c;
            margin-bottom: 4px;
        }

        .modal-campaign-operator {
            font-size: 0.92rem;
            color: #55486d;
            font-weight: 500;
        }

        .modal-field-label {
            font-size: 0.95rem;
            font-weight: 700;
            color: #2b1d4c;
            margin-bottom: 6px;
        }

        .modal-input {
            width: 100%;
            height: 44px;
            border-radius: 12px;
            border: 1.5px solid #d5c8ed;
            background-color: #faf8fd;
            padding: 0 16px;
            font-family: inherit;
            font-size: 0.92rem;
            color: #2a1e46;
            outline: none;
            margin-bottom: 14px;
        }

        .modal-textarea {
            width: 100%;
            min-height: 80px;
            border-radius: 12px;
            border: 1.5px solid #d5c8ed;
            background-color: #faf8fd;
            padding: 12px 16px;
            font-family: inherit;
            font-size: 0.92rem;
            color: #2a1e46;
            outline: none;
            resize: vertical;
            line-height: 1.45;
            margin-bottom: 16px;
        }

        .modal-dampak-box {
            background-color: #ebe2f8;
            border-radius: 14px;
            padding: 18px 20px;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .modal-dampak-title {
            font-size: 0.96rem;
            font-weight: 800;
            color: #2b1d4c;
        }

        .modal-dampak-list {
            margin-left: 20px;
            display: flex;
            flex-direction: column;
            gap: 4px;
            color: #4f4066;
            font-size: 0.88rem;
            line-height: 1.45;
        }

        .modal-disclaimer-text {
            margin-top: 10px;
            font-size: 0.86rem;
            font-weight: 700;
            color: #2b1d4c;
        }

        .modal-actions-row {
            display: grid;
            grid-template-columns: 1fr 1.6fr;
            gap: 16px;
            margin-top: 24px;
        }

        .modal-btn-cancel {
            height: 50px;
            border-radius: 14px;
            border: 1.5px solid #8e909e;
            background-color: #ffffff;
            color: #2c2938;
            font-size: 1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.15s ease;
            font-family: inherit;
        }

        .modal-btn-cancel:hover {
            background-color: #f7f6f9;
        }

        .modal-btn-confirm {
            height: 50px;
            border-radius: 14px;
            border: none;
            background-color: #c42b2b;
            color: #ffffff;
            font-size: 1.02rem;
            font-weight: 700;
            cursor: pointer;
            box-shadow: 0 4px 14px rgba(196, 43, 43, 0.35);
            transition: all 0.15s ease;
            font-family: inherit;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }

        .modal-btn-confirm:hover {
            background-color: #a92020;
            transform: translateY(-1px);
        }

        /* ========== LOGOUT MODAL ========== */
        .logout-modal-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(30, 20, 50, 0.45);
            backdrop-filter: blur(2px);
            -webkit-backdrop-filter: blur(2px);
            z-index: 99999;
            display: none;
            align-items: center;
            justify-content: center;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.25s ease;
        }

        .logout-modal-backdrop.show {
            display: flex !important;
            opacity: 1 !important;
            pointer-events: auto !important;
        }

        .logout-modal-card {
            background: #ffffff;
            width: 90%;
            max-width: 580px;
            border-radius: 28px;
            padding: 38px 40px 34px 40px;
            box-shadow: 0 25px 60px -10px rgba(0, 0, 0, 0.22);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            transform: scale(0.92);
            transition: transform 0.25s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .logout-modal-backdrop.show .logout-modal-card {
            transform: scale(1);
        }

        .logout-modal-logo {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 4px;
            margin-bottom: 20px;
        }

        .logout-modal-logo-img {
            width: 48px;
            height: 48px;
            object-fit: contain;
            display: block;
        }

        .logout-modal-logo-text {
            font-size: 1.55rem;
            font-weight: 800;
            letter-spacing: -0.025em;
            background: linear-gradient(90deg, #502b8d 0%, #855cb8 50%, #e2c044 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            display: inline-block;
            line-height: 1.2;
        }

        .logout-modal-title {
            font-size: 1.7rem;
            font-weight: 800;
            color: #1f1b26;
            margin-bottom: 30px;
            letter-spacing: -0.02em;
        }

        .logout-modal-actions {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            width: 100%;
        }

        .logout-btn-cancel {
            height: 54px;
            border-radius: 16px;
            border: 2px solid #cfcfcf;
            background: #ffffff;
            color: #4a4e5a;
            font-size: 1.45rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            font-family: inherit;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .logout-btn-cancel:hover {
            background-color: #f5f5f7;
            border-color: #b0b0b0;
            color: #222;
        }

        .logout-btn-confirm {
            height: 54px;
            border-radius: 16px;
            border: none;
            background: #ff4040;
            color: #ffffff;
            font-size: 1.45rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            font-family: inherit;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            box-shadow: 0 6px 18px rgba(255, 64, 64, 0.35);
        }

        .logout-btn-confirm:hover {
            background: #e62e2e;
            transform: translateY(-1px);
            box-shadow: 0 8px 22px rgba(255, 64, 64, 0.45);
        }
    </style>
</head>
<body>
    <div class="app-wrapper">
        <!-- ======== SIDEBAR ======== -->
        <aside class="sidebar">
            <a href="{{ route('dashboard') }}" class="sidebar-brand">
                <div class="brand-logo-badge" aria-hidden="true">
                    <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
                </div>
                <div class="brand-text-block">
                    <div class="brand-wordmark-wrap">
                        <span class="brand-wordmark brand-gradient">Benevo</span>
                        <div class="brand-yellow-dot" aria-hidden="true"></div>
                    </div>
                    <div class="brand-platform-sub">CMS PLATFORM</div>
                </div>
            </a>

            <div class="mode-banner">
                <div class="mode-left">
                    <span class="mode-dot"></span>
                    <div>
                        <div class="mode-title">Modus Operasi</div>
                        <div class="mode-sub">Admin</div>
                    </div>
                </div>
                <span class="mode-badge">Aktif</span>
            </div>

            <!-- Menu Utama -->
            <div class="nav-section">
                <div class="nav-section-title">Menu Utama</div>
                <ul class="nav-list">
                    <li>
                        <a href="{{ route('dashboard') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1.5"/><rect x="14" y="3" width="7" height="7" rx="1.5"/><rect x="14" y="14" width="7" height="7" rx="1.5"/><rect x="3" y="14" width="7" height="7" rx="1.5"/></svg>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('rekapitulasi-dana') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><path d="M21 12V7H5a2 2 0 0 1 0-4h14v4"/><path d="M3 5v14a2 2 0 0 0 2 2h16v-5"/><path d="M18 12a2 2 0 0 0 0 4h4v-4z"/></svg>
                            Rekapitulasi Dana
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('manajemen-kampanye') }}" class="nav-link active">
                            <svg viewBox="0 0 24 24"><path d="M3 11l18-5v12L3 14v-3z"/><path d="M11.6 16.8a3 3 0 1 1-5.8-1.6"/></svg>
                            Manajemen Kampanye
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('donatur') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                            Donatur
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Admin Section -->
            <div class="nav-section">
                <div class="nav-section-title">Admin</div>
                <ul class="nav-list">
                    <li>
                        <a href="{{ route('kelola-akun-operator') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"/><circle cx="12" cy="12" r="3"/></svg>
                            Kelola Akun Operator
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Sidebar Bottom: Logout Button -->
            <div class="sidebar-footer">
                <button type="button" class="logout-btn" onclick="openLogoutModal()" aria-label="Log out">
                    <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                        <path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/>
                        <polyline points="16 17 21 12 16 7"/>
                        <line x1="21" y1="12" x2="9" y2="12"/>
                    </svg>
                    <span>Log out</span>
                </button>
            </div>
        </aside>

        <!-- ======== MAIN WRAPPER ======== -->
        <div class="main-wrapper">
            <!-- Topbar -->
            <header class="topbar">
                <div class="search-container">
                    <span class="search-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"/>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"/>
                        </svg>
                    </span>
                    <input type="text" class="search-input" placeholder="Cari Apapun...">
                </div>

                <div class="topbar-right">
                    <button class="date-picker-btn" type="button">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                            <line x1="16" y1="2" x2="16" y2="6"/>
                            <line x1="8" y1="2" x2="8" y2="6"/>
                            <line x1="3" y1="10" x2="21" y2="10"/>
                        </svg>
                        <span>30 Hari Terakhir</span>
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="width:11px;height:11px;">
                            <polyline points="6 9 12 15 18 9"/>
                        </svg>
                    </button>
                    <button class="icon-action-btn" type="button">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                        </svg>
                        <span class="notif-badge-dot"></span>
                    </button>
                    <button class="help-action-btn" type="button">?</button>
                    <div class="profile-pill">
                        <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=120&q=80" alt="Harry Vaughan" class="profile-avatar">
                        <div>
                            <div class="profile-name">Harry Vaughan</div>
                            <div class="profile-role">Admin</div>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Main Content (Images 4 & 5) -->
            <main class="content-area">
                <div class="back-nav-wrap">
                    <a href="{{ route('kampanye-ditinjau') }}" class="back-nav-link">
                        <svg viewBox="0 0 24 24" width="16" height="16" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>
                        Kembali ke Kampanye perlu Ditinjau
                    </a>
                </div>

                <h1 class="page-title">Peninjauan</h1>

                <!-- Detail Review Card -->
                <div class="review-card">
                    <h2 class="review-card-title">K02 : Darurat Karhutla Kalimantan</h2>

                    <!-- Operator Box -->
                    <div class="operator-box">
                        <span class="operator-box-label">Operator</span>
                        <span class="operator-box-name">Komunitas Hijau Borneo</span>
                    </div>

                    <!-- Details Row -->
                    <div class="detail-boxes-row">
                        <div class="detail-box">
                            <span class="detail-box-label">Dana Terkumpul</span>
                            <span class="detail-box-value">Rp 97,7 jt / Rp 150jt</span>
                        </div>
                        <div class="detail-box">
                            <span class="detail-box-label">Periode waktu</span>
                            <span class="detail-box-value">20 hari</span>
                        </div>
                    </div>

                    <!-- Jenis Laporan -->
                    <div class="field-label">Jenis Laporan</div>
                    <div class="report-type-pill">Penggunaan dana tidak transparan</div>

                    <!-- Isi Laporan -->
                    <div class="field-label">isi laporan</div>
                    <div class="report-content-box">
                        Dana sudah terkumpul banyak, tetapi tidak ada pembaharuan kabar dalam penyaluran
                    </div>

                    <!-- Catatan Keputusan Admin -->
                    <div class="field-label">Catatan keputusan admin<span class="req">*</span></div>
                    <textarea class="decision-textarea" placeholder="isi pertimbangan singkat..."></textarea>

                    <!-- Action Buttons -->
                    <div class="actions-row">
                        <a href="{{ route('kampanye-ditinjau') }}" class="btn-abaikan">Abaikan Laporan</a>
                        <button type="button" class="btn-bekukan-action" onclick="openBekukanModal()">Bekukan Kampanye</button>
                    </div>
                </div>
            </main>
        </div>
    </div>

    <!-- ================= CONFIRMATION MODAL POPUP (Image 5) ================= -->
    <div class="bekukan-modal-backdrop" id="bekukanModal" role="dialog" aria-modal="true" aria-labelledby="bekukanModalTitle">
        <div class="bekukan-modal-card">
            <h3 class="bekukan-modal-title" id="bekukanModalTitle">Konfirmasi Pembekuan Kampanye</h3>

            <!-- Campaign Info -->
            <div class="modal-campaign-box">
                <div class="modal-campaign-name">K02 : Darurat Karhutla Kalimantan</div>
                <div class="modal-campaign-operator">Operator : Komunitas Hijau Borneo</div>
            </div>

            <!-- Form Inputs -->
            <div class="modal-field-label">Alasan Pembekuan*</div>
            <input type="text" class="modal-input" value="Tidak ada laporan penggunaan dana selama kampanye berjalan">

            <div class="modal-field-label">Catatan untuk Operator*</div>
            <textarea class="modal-textarea">kampanye akan dibekukan, selama pembekuan kampanye, cairkan transaksi, dan</textarea>

            <!-- Dampak Pembekuan -->
            <div class="modal-dampak-box">
                <div class="modal-dampak-title">Dampak Pembekuan</div>
                <ul class="modal-dampak-list">
                    <li>Kampanye disembunyikan dari donatur dan tidak menerima donasi baru.</li>
                    <li>Operator menerima Notifikasi berisi alasan dan catatan di atas.</li>
                    <li>Dana yang sudah masuk ke rekening operator tidak berpengaruh</li>
                </ul>
                <div class="modal-disclaimer-text">
                    Saya sudah meninjau laporan dan yakin ini perlu dibekukan
                </div>
            </div>

            <!-- Actions -->
            <div class="modal-actions-row">
                <button type="button" class="modal-btn-cancel" onclick="closeBekukanModal()">Batal</button>
                <a href="{{ route('kampanye-ditinjau') }}" class="modal-btn-confirm">Ya, Bekukan Kampanye</a>
            </div>
        </div>
    </div>

    <!-- ================= LOGOUT MODAL POPUP ================= -->
    <div class="logout-modal-backdrop" id="logoutModal" role="dialog" aria-modal="true" aria-labelledby="logoutModalTitle">
        <div class="logout-modal-card">
            <div class="logout-modal-logo">
                <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo" class="logout-modal-logo-img">
                <span class="logout-modal-logo-text">Benevo</span>
            </div>
            
            <h2 class="logout-modal-title" id="logoutModalTitle">Apakah anda yakin untuk Keluar?</h2>
            
            <div class="logout-modal-actions">
                <button type="button" class="logout-btn-cancel" onclick="closeLogoutModal()">Batal</button>
                <a href="{{ route('login') }}" class="logout-btn-confirm">Keluar</a>
            </div>
        </div>
    </div>

    <script>
        function openBekukanModal() {
            const modal = document.getElementById('bekukanModal');
            if (modal) {
                modal.classList.add('show');
                document.body.style.overflow = 'hidden';
            }
        }

        function closeBekukanModal() {
            const modal = document.getElementById('bekukanModal');
            if (modal) {
                modal.classList.remove('show');
                document.body.style.overflow = '';
            }
        }

        function openLogoutModal() {
            const modal = document.getElementById('logoutModal');
            if (modal) {
                modal.classList.add('show');
                document.body.style.overflow = 'hidden';
            }
        }

        function closeLogoutModal() {
            const modal = document.getElementById('logoutModal');
            if (modal) {
                modal.classList.remove('show');
                document.body.style.overflow = '';
            }
        }

        document.addEventListener('click', function(e) {
            const bekukanModal = document.getElementById('bekukanModal');
            if (e.target === bekukanModal) {
                closeBekukanModal();
            }
            const logoutModal = document.getElementById('logoutModal');
            if (e.target === logoutModal) {
                closeLogoutModal();
            }
        });

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeBekukanModal();
                closeLogoutModal();
            }
        });
    </script>
</body>
</html>
