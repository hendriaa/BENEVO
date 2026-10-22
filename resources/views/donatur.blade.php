<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Donatur</title>
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
            --brand-success-bg: #daf7e5;
            --brand-success-text: #199447;
            --brand-warning-bg: #fde8db;
            --brand-warning-text: #cb5d2c;
            --input-bg: #ffffff;
            --input-border: #d8c9f0;
            --table-header-bg: #f6f2fc;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        html, body {
            min-height: 100%;
            background: var(--bg-page);
            color: var(--brand-text-dark);
        }

        body {
            min-height: 100vh;
            -webkit-font-smoothing: antialiased;
        }

        a {
            text-decoration: none;
        }

        button, input, select {
            font: inherit;
        }

        .app-wrapper {
            display: flex;
            width: 100%;
            min-height: 100vh;
            background: var(--bg-page);
        }

        .sidebar {
            width: 248px;
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
            padding-left: 0;
        }

        .brand-logo-badge {
            width: 38px;
            height: 38px;
            background: transparent;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: none;
            flex-shrink: 0;
            overflow: hidden;
        }

        .brand-logo-badge svg {
            width: 100%;
            height: 100%;
            display: block;
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
            justify-content: center;
            align-items: flex-start;
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
            color: #7a4fb2;
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
            font-size: 0.8rem;
            font-weight: 600;
            color: #747783;
            margin-bottom: 10px;
            padding-left: 8px;
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
            gap: 10px;
            padding: 10px 14px;
            border-radius: 9px;
            font-size: 0.88rem;
            font-weight: 600;
            color: #555966;
            transition: all 0.2s ease;
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

        .nav-link:hover {
            background-color: #f6f0fc;
            color: #61389e;
        }

        .nav-link.active {
            background-color: var(--brand-purple);
            color: #ffffff;
            box-shadow: 0 4px 14px rgba(133, 92, 184, 0.35);
        }

        .nav-link.active svg {
            stroke: #ffffff;
        }

        .main-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-width: 0;
            overflow-x: hidden;
        }

        .topbar {
            height: 66px;
            background-color: #ffffff;
            border-bottom: 1px solid var(--brand-border);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 30px;
            gap: 16px;
            flex-shrink: 0;
        }

        .search-container {
            position: relative;
            width: 100%;
            max-width: 340px;
        }

        .search-icon {
            position: absolute;
            left: 13px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ea2ae;
            display: flex;
            align-items: center;
            pointer-events: none;
        }

        .search-icon svg {
            width: 16px;
            height: 16px;
        }

        .search-input {
            width: 100%;
            height: 40px;
            background-color: #fbf9fd;
            border: 1px solid #ece4f5;
            border-radius: 9999px;
            padding: 0 14px 0 36px;
            font-size: 0.86rem;
            color: #2b2e38;
            outline: none;
            transition: all 0.2s;
        }

        .search-input:focus {
            background-color: #ffffff;
            border-color: var(--brand-purple);
            box-shadow: 0 0 0 2px rgba(133, 92, 184, 0.15);
        }

        .search-input::placeholder {
            color: #9fa3af;
        }

        .topbar-right {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .date-picker-btn {
            display: flex;
            align-items: center;
            gap: 7px;
            height: 38px;
            padding: 0 12px;
            background-color: #ffffff;
            border: 1px solid #e7dff2;
            border-radius: 8px;
            font-size: 0.8rem;
            font-weight: 600;
            color: #4b4f5a;
            cursor: pointer;
        }

        .date-picker-btn svg {
            width: 14px;
            height: 14px;
            color: #7957a7;
        }

        .icon-action-btn {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            background: #ffffff;
            border: 1px solid #e7dff2;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #555866;
            position: relative;
        }

        .icon-action-btn svg {
            width: 16px;
            height: 16px;
        }

        .notif-badge-dot {
            position: absolute;
            top: 6px;
            right: 6px;
            width: 6px;
            height: 6px;
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
            font-size: 0.9rem;
            font-weight: 700;
        }

        .profile-pill {
            display: flex;
            align-items: center;
            gap: 9px;
            margin-left: 4px;
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
            font-size: 0.84rem;
            font-weight: 700;
            color: #232227;
            line-height: 1.2;
        }

        .profile-role {
            font-size: 0.7rem;
            font-weight: 500;
            color: #797c88;
        }

        .content-area {
            padding: 26px 30px 40px 30px;
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        .page-title {
            font-size: 1.9rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.025em;
        }

        .metrics-row {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
            max-width: 680px;
        }

        .metric-card {
            background-color: var(--bg-card);
            border-radius: 16px;
            padding: 20px 22px;
            box-shadow: 0 2px 12px rgba(100, 60, 150, 0.05);
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            gap: 12px;
        }

        .metric-text {
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .metric-label {
            font-size: 0.85rem;
            font-weight: 600;
            color: #5c606d;
        }

        .metric-value {
            font-size: 1.7rem;
            font-weight: 800;
            color: var(--brand-text-dark);
            letter-spacing: -0.03em;
            line-height: 1.1;
        }

        .donor-table-card {
            background-color: var(--bg-card);
            border-radius: 18px;
            padding: 22px 26px;
            box-shadow: 0 2px 14px rgba(100, 60, 150, 0.05);
        }

        .table-header-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 16px;
            flex-wrap: wrap;
            gap: 12px;
        }

        .table-title-block {
            display: flex;
            flex-direction: column;
        }

        .card-section-title {
            font-size: 1.25rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.02em;
        }

        .card-section-sub {
            font-size: 0.76rem;
            color: #878b98;
            font-weight: 500;
            margin-top: 3px;
        }

        .donor-table {
            width: 100%;
            border-collapse: collapse;
            font-size: 0.82rem;
        }

        .donor-table thead {
            background-color: #f6f2fc;
        }

        .donor-table thead th {
            padding: 12px 14px;
            text-align: left;
            font-size: 0.8rem;
            font-weight: 700;
            color: #5b4d76;
            white-space: nowrap;
        }

        .donor-table tbody tr {
            border-bottom: 1px solid #f0eaf8;
            transition: background 0.15s;
        }

        .donor-table tbody tr:last-child {
            border-bottom: none;
        }

        .donor-table tbody tr:hover {
            background-color: #faf7fd;
        }

        .donor-table td {
            padding: 14px 14px;
            color: #2d2e35;
            font-weight: 500;
            vertical-align: top;
        }

        .donor-id {
            font-weight: 700;
            color: #4a3870;
            font-size: 0.8rem;
        }

        .donor-name {
            font-weight: 600;
            color: #2d2e35;
        }

        .donor-handle {
            font-size: 0.74rem;
            color: #888c99;
            display: block;
            margin-top: 2px;
        }

        .donor-date {
            color: #2d2e35;
        }

        .donor-count,
        .nominal-val {
            font-weight: 700;
            color: #1f1b26;
        }

        .status-badge {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            padding: 5px 12px;
            border-radius: 99px;
            font-size: 0.74rem;
            font-weight: 700;
        }

        .status-badge.aktif {
            background-color: var(--brand-success-bg);
            color: var(--brand-success-text);
        }

        .status-badge.aktif-red {
            background-color: var(--brand-warning-bg);
            color: var(--brand-warning-text);
        }

        .status-badge svg {
            width: 8px;
            height: 8px;
            fill: currentColor;
        }

        .table-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 18px;
            padding-top: 14px;
            border-top: 1px solid #f0eaf8;
        }

        .table-info {
            font-size: 0.78rem;
            color: #888c99;
            font-weight: 500;
        }

        .pagination {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .page-btn {
            width: 32px;
            height: 32px;
            border-radius: 8px;
            border: 1px solid #ddd4ef;
            background: #ffffff;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            font-size: 0.82rem;
            font-weight: 600;
            color: #5a4780;
            transition: all 0.15s;
        }

        .page-btn:hover {
            background: #f4effc;
            border-color: #c8b8e8;
        }

        .page-btn.active {
            background-color: var(--brand-purple);
            border-color: var(--brand-purple);
            color: #ffffff;
        }

        .page-btn svg {
            width: 14px;
            height: 14px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2.5;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        @media (max-width: 768px) {
            .app-wrapper {
                display: block;
            }

            .sidebar {
                display: none;
            }

            .content-area {
                padding: 20px;
            }

            .metrics-row {
                grid-template-columns: 1fr;
            }

            .topbar {
                padding: 16px 20px;
            }
        }
    
        /* ========== LOGOUT SIDEBAR BUTTON & MODAL POPUP ========== */
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

        /* Modal Backdrop */
        .logout-modal-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(30, 20, 50, 0.45);
            backdrop-filter: blur(2px);
            -webkit-backdrop-filter: blur(2px);
            z-index: 99999;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.25s ease, visibility 0.25s ease;
        }

        .logout-modal-backdrop.show {
            opacity: 1;
            visibility: visible;
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
    
        .sidebar::-webkit-scrollbar {
            width: 4px;
        }
        .sidebar::-webkit-scrollbar-thumb {
            background: #e5daf3;
            border-radius: 4px;
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
                    <a href="{{ route('manajemen-kampanye') }}" class="nav-link">
                        <svg viewBox="0 0 24 24"><path d="M3 11l18-5v12L3 14v-3z"/><path d="M11.6 16.8a3 3 0 1 1-5.8-1.6"/></svg>
                        Manajemen Kampanye
                    </a>
                </li>
                <li>
                    <a href="{{ route('donatur') }}" class="nav-link active">
                        <svg viewBox="0 0 24 24"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M22 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                        Donatur
                    </a>
                </li>
            </ul>
        </div>
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
    <!-- ======== MAIN CONTENT ======== -->
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
        <!-- Page Content -->
        <main class="content-area">
            <h1 class="page-title">Donatur</h1>
            <!-- METRIC CARDS -->
            <div class="metrics-row">
                <div class="metric-card">
                    <div class="metric-text">
                        <div class="metric-label">Total Donatur</div>
                        <div class="metric-value">211</div>
                    </div>
                </div>
                <div class="metric-card">
                    <div class="metric-text">
                        <div class="metric-label">Anonymous</div>
                        <div class="metric-value">40</div>
                    </div>
                </div>
            </div>
            <!-- DONOR TABLE -->
            <div class="donor-table-card">
                <div class="table-header-row">
                    <div class="table-title-block">
                        <div class="card-section-title">Daftar Donatur</div>
                        <div class="card-section-sub">Daftar donatur yang telah berdonasi di platform.</div>
                    </div>
                </div>
                <table class="donor-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Donatur</th>
                            <th>Bergabung</th>
                            <th>Total Donasi</th>
                            <th>Total Nominal</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><span class="donor-id">D01</span></td>
                            <td>
                                <div class="donor-name">Anonymous</div>
                                <div class="donor-handle">@anonymous_...</div>
                            </td>
                            <td><div class="donor-date">20 jan 2026</div></td>
                            <td><div class="donor-count">21</div></td>
                            <td><div class="nominal-val">Rp 2.700.000</div></td>
                            <td>
                                <span class="status-badge aktif">
                                    <svg viewBox="0 0 24 24" width="8" height="8"><circle cx="12" cy="12" r="10"/></svg>
                                    Aktif
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="donor-id">D02</span></td>
                            <td>
                                <div class="donor-name">hn.drii_</div>
                                <div class="donor-handle">@hn.drii_</div>
                            </td>
                            <td><div class="donor-date">23 jun 2026</div></td>
                            <td><div class="donor-count">19</div></td>
                            <td><div class="nominal-val">Rp 1.500.000</div></td>
                            <td>
                                <span class="status-badge aktif">
                                    <svg viewBox="0 0 24 24" width="8" height="8"><circle cx="12" cy="12" r="10"/></svg>
                                    Aktif
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="donor-id">D03</span></td>
                            <td>
                                <div class="donor-name">ra.syaa_</div>
                                <div class="donor-handle">@ra.syaa_</div>
                            </td>
                            <td><div class="donor-date">24 jun 2026</div></td>
                            <td><div class="donor-count">20</div></td>
                            <td><div class="nominal-val">Rp 930.000</div></td>
                            <td>
                                <span class="status-badge aktif">
                                    <svg viewBox="0 0 24 24" width="8" height="8"><circle cx="12" cy="12" r="10"/></svg>
                                    Aktif
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="donor-id">D04</span></td>
                            <td>
                                <div class="donor-name">au.liaa_</div>
                                <div class="donor-handle">@au.liaa_</div>
                            </td>
                            <td><div class="donor-date">17 Aug 2026</div></td>
                            <td><div class="donor-count">14</div></td>
                            <td><div class="nominal-val">Rp 720.000</div></td>
                            <td>
                                <span class="status-badge aktif">
                                    <svg viewBox="0 0 24 24" width="8" height="8"><circle cx="12" cy="12" r="10"/></svg>
                                    Aktif
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="donor-id">D05</span></td>
                            <td>
                                <div class="donor-name">fha.rell_</div>
                                <div class="donor-handle">@fha.rell_</div>
                            </td>
                            <td><div class="donor-date">21 Sep 2026</div></td>
                            <td><div class="donor-count">15</div></td>
                            <td><div class="nominal-val">Rp 513.000</div></td>
                            <td>
                                <span class="status-badge aktif">
                                    <svg viewBox="0 0 24 24" width="8" height="8"><circle cx="12" cy="12" r="10"/></svg>
                                    Aktif
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="donor-id">D06</span></td>
                            <td>
                                <div class="donor-name">zul.fann_</div>
                                <div class="donor-handle">@zul.fann_</div>
                            </td>
                            <td><div class="donor-date">22 Sep 2026</div></td>
                            <td><div class="donor-count">10</div></td>
                            <td><div class="nominal-val">Rp 470.000</div></td>
                            <td>
                                <span class="status-badge aktif">
                                    <svg viewBox="0 0 24 24" width="8" height="8"><circle cx="12" cy="12" r="10"/></svg>
                                    Aktif
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td><span class="donor-id">D07</span></td>
                            <td>
                                <div class="donor-name">Anonymous</div>
                                <div class="donor-handle">@anonymous_...</div>
                            </td>
                            <td><div class="donor-date">01 Okt 2026</div></td>
                            <td><div class="donor-count">5</div></td>
                            <td><div class="nominal-val">Rp 120.000</div></td>
                            <td>
                                <span class="status-badge aktif-red">
                                    <svg viewBox="0 0 24 24" width="8" height="8"><circle cx="12" cy="12" r="10"/></svg>
                                    Aktif
                                </span>
                            </td>
                        </tr>
                    </tbody>
                </table>
                <div class="table-footer">
                    <div class="table-info">Menampilkan 7 dari 203 Lainnya</div>
                    <div class="pagination">
                        <button class="page-btn" type="button">
                            <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"/></svg>
                        </button>
                        <button class="page-btn active" type="button">1</button>
                        <button class="page-btn" type="button">
                            <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"/></svg>
                        </button>
                    </div>
                </div>
            </div>
        </main>
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
            const modal = document.getElementById('logoutModal');
            if (e.target === modal) {
                closeLogoutModal();
            }
        });

        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeLogoutModal();
            }
        });
    </script>
</body>
</html>
