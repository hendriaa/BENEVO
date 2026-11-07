<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Kelola Akun Operator</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        :root { --bg-page: #f2ecfa; --bg-sidebar: #ffffff; --bg-card: #ffffff; --brand-purple: #855cb8; --brand-purple-heading: #2d174e; --brand-text-dark: #1f1b26; --brand-text-muted: #6e727e; --brand-border: #e9e2f5; --brand-success: #4ade80; --brand-success-bg: #dcfce7; --brand-success-text: #15803d; --brand-danger: #f87171; --brand-danger-bg: #fee2e2; --brand-danger-text: #991b1b; --input-bg: #ffffff; --input-border: #d8c9f0; --table-header-bg: #c7b3e8; }
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Plus Jakarta Sans', sans-serif; background-color: var(--bg-page); color: var(--brand-text-dark); min-height: 100vh; display: flex; -webkit-font-smoothing: antialiased; }
        .app-wrapper { display: flex; width: 100vw; min-height: 100vh; overflow: hidden; }
        .sidebar {
            width: 275px; max-width: 275px;
            background-color: var(--bg-sidebar);
            border-right: 1px solid var(--brand-border);
            display: flex;
            flex-direction: column;
            padding: 24px 16px 24px 16px;
            flex-shrink: 0;
            min-height: 100vh;
            height: 100vh;
            position: sticky;
            top: 0;
            align-self: flex-start;
            overflow-y: auto;
            z-index: 100;
        }
        .sidebar-brand { display: flex; align-items: center; gap: 12px; padding-left: 0; text-decoration: none; }
        .brand-logo-badge { width: 38px; height: 38px; background: transparent; border-radius: 10px; display: flex; align-items: center; justify-content: center; box-shadow: none; flex-shrink: 0; overflow: hidden; }
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
        .brand-wordmark-wrap { position: relative; display: inline-flex; align-items: center; }
        .brand-wordmark { font-size: 2.1rem; font-weight: 800; letter-spacing: -0.06em; line-height: 0.9; color: #7a4fb2; }

        .brand-gradient {
            background: linear-gradient(90deg, #6d3ca1 0%, #8e6bc6 40%, #c9a227 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .brand-yellow-dot { position: absolute; right: -8px; top: 5px; width: 9px; height: 9px; background-color: #f4d566; border-radius: 50%; }
        .brand-platform-sub { font-size: 0.62rem; font-weight: 800; letter-spacing: 0.12em; color: #7c5a9f; margin-top: 2px; text-transform: uppercase; }
        .mode-banner { margin-top: 24px; background-color: #f0e8fc; border-radius: 10px; padding: 10px 12px; display: flex; align-items: center; justify-content: space-between; }
        .mode-left { display: flex; align-items: center; gap: 8px; }
        .mode-dot { width: 9px; height: 9px; background-color: #6a3ab2; border-radius: 50%; }
        .mode-title { font-size: 0.85rem; font-weight: 700; color: #3b2260; line-height: 1.2; }
        .mode-sub { font-size: 0.73rem; color: #7d6b97; font-weight: 500; }
        .mode-badge { background-color: #fde8db; color: #cb5d2c; font-size: 0.68rem; font-weight: 700; padding: 2px 7px; border-radius: 5px; }
        .nav-section { margin-top: 24px; }
        .nav-section-title { font-size: 0.8rem; font-weight: 600; color: #747783; margin-bottom: 10px; padding-left: 8px; }
        .nav-list { list-style: none; display: flex; flex-direction: column; gap: 4px; }
        .nav-link { display: flex; align-items: center; gap: 10px; padding: 10px 14px; border-radius: 9px; text-decoration: none; font-size: 0.88rem; font-weight: 600; color: #555966; transition: all 0.2s ease; }
        .nav-link svg { width: 18px; height: 18px; fill: none; stroke: currentColor; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; flex-shrink: 0; }
        .nav-link:hover { background-color: #f6f0fc; color: #61389e; }
        .nav-link.active { background-color: var(--brand-purple); color: #ffffff; box-shadow: 0 4px 14px rgba(133, 92, 184, 0.35); }
        .nav-link.active svg { stroke: #ffffff; }
        .main-content { flex: 1; display: flex; flex-direction: column; min-height: 100vh; }
                /* ----------------- TOPBAR ----------------- */
        .topbar {
            height: 72px;
            background-color: #ffffff;
            border-bottom: 1px solid var(--brand-border);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 36px;
            gap: 20px;
            flex-shrink: 0;
        }

        .search-container {
            position: relative;
            width: 100%;
            max-width: 380px;
        }

        .search-icon {
            position: absolute;
            left: 14px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ea2ae;
            display: flex;
            align-items: center;
            pointer-events: none;
        }

        .search-icon svg {
            width: 18px;
            height: 18px;
        }

        .search-input {
            width: 100%;
            height: 42px;
            background-color: #fbf9fd;
            border: 1px solid #ece4f5;
            border-radius: 9999px;
            padding: 0 16px 0 40px;
            font-size: 0.88rem;
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

        /* Topbar Right Actions */
        .topbar-right {
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .date-picker-btn {
            display: flex;
            align-items: center;
            gap: 8px;
            height: 40px;
            padding: 0 14px;
            background-color: #ffffff;
            border: 1px solid #e7dff2;
            border-radius: 8px;
            font-size: 0.82rem;
            font-weight: 600;
            color: #4b4f5a;
            cursor: pointer;
            transition: background 0.15s;
        }

        .date-picker-btn:hover {
            background-color: #faf7fd;
        }

        .date-picker-btn svg {
            width: 16px;
            height: 16px;
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
            transition: all 0.15s;
        }

        .icon-action-btn:hover {
            background-color: #faf7fd;
            color: var(--brand-purple);
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

        .help-action-btn:hover {
            background-color: #794ea8;
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

        .profile-info {
            display: flex;
            flex-direction: column;
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
        .page-content { flex: 1; padding: 32px; overflow-y: auto; }
        .page-header { margin-bottom: 24px; }
        .page-title { font-size: 2rem; font-weight: 800; color: var(--brand-purple-heading); margin-bottom: 8px; letter-spacing: -0.02em; }
        .stat-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(220px, 1fr)); gap: 16px; margin-bottom: 24px; }
        .stat-card { background: var(--bg-card); border-radius: 16px; padding: 20px 24px; box-shadow: 0 2px 8px rgba(133, 92, 184, 0.1); }
        .stat-card-label { font-size: 0.85rem; font-weight: 700; color: var(--brand-purple-heading); margin-bottom: 8px; text-transform: uppercase; letter-spacing: 0.02em; }
        .stat-card-value { font-size: 2rem; font-weight: 800; color: var(--brand-text-dark); line-height: 1.2; }
        .status-filter { display: inline-flex; align-items: center; gap: 8px; padding: 8px 16px; border-radius: 10px; border: 1px solid var(--input-border); background: var(--input-bg); font-size: 0.85rem; font-weight: 600; color: var(--brand-text-dark); margin-bottom: 24px; cursor: pointer; outline: none; }
        .table-container { background: var(--bg-card); border-radius: 16px; overflow: hidden; box-shadow: 0 2px 8px rgba(133, 92, 184, 0.1); }
        .data-table { width: 100%; border-collapse: collapse; }
        .data-table th { background-color: var(--table-header-bg); color: #ffffff; font-size: 0.85rem; font-weight: 700; text-align: left; padding: 14px 16px; text-transform: uppercase; letter-spacing: 0.03em; }
        .data-table td { padding: 14px 16px; border-bottom: 1px solid #f0e8fc; font-size: 0.88rem; color: var(--brand-text-dark); }
        .data-table tr:last-child td { border-bottom: none; }
        .data-table tr:hover td { background-color: #fcf8ff; }
        .operator-id { font-weight: 700; color: var(--brand-text-muted); font-size: 0.85rem; }
        .operator-name { font-weight: 600; color: var(--brand-text-dark); }
        .session-badge { display: flex; align-items: center; gap: 6px; font-size: 0.85rem; font-weight: 600; }
        .session-badge .dot { width: 8px; height: 8px; border-radius: 50%; }
        .session-badge .dot.online { background-color: var(--brand-success); }
        .session-badge .dot.offline { background-color: #9ca3af; }
        .session-badge.online { color: var(--brand-success-text); }
        .session-badge.offline { color: var(--brand-text-muted); }
        .status-badge { display: inline-flex; align-items: center; gap: 6px; padding: 4px 10px; border-radius: 6px; font-size: 0.78rem; font-weight: 700; }
        .status-badge.aktif { background-color: var(--brand-success-bg); color: var(--brand-success-text); }
        .status-badge.ditangguhkan { background-color: var(--brand-danger-bg); color: var(--brand-danger-text); }
        .status-badge svg { width: 10px; height: 10px; fill: none; stroke: currentColor; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
        .table-footer { display: flex; justify-content: space-between; align-items: center; margin-top: 16px; padding-top: 12px; border-top: 1px solid #f0e8fc; }
        .table-info { font-size: 0.85rem; font-weight: 600; color: var(--brand-text-dark); }
        .pagination { display: flex; align-items: center; gap: 8px; }
        .page-btn { width: 38px; height: 38px; border-radius: 8px; border: 1px solid #d8c9f0; background: #ffffff; display: flex; align-items: center; justify-content: center; cursor: pointer; font-size: 0.85rem; font-weight: 600; color: #7d6b97; transition: all 0.2s; }
        .page-btn:hover { border-color: var(--brand-purple); color: var(--brand-purple); }
        .page-btn.active { background: #e9e2f5; border-color: var(--brand-purple); color: var(--brand-purple-heading); }
        .page-btn svg { width: 12px; height: 12px; fill: none; stroke: currentColor; stroke-width: 2; }
        @media (max-width: 768px) { .sidebar { display: none; } .topbar { padding: 16px 20px; } .page-content { padding: 20px; } .stat-grid { grid-template-columns: 1fr; } }
    
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
        <aside class="sidebar">
            <a href="{{ route('dashboard') }}" class="sidebar-brand">
                <div class="brand-logo-badge">
            <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
        </div>
                <div class="brand-text-block">
                    <div class="brand-wordmark-wrap">
                        <span class="brand-wordmark brand-gradient">Benevo</span>
                        <span class="brand-yellow-dot"></span>
                    </div>
                    <div class="brand-platform-sub">CMS PLATFORM</div>
                </div>
            </a>

            <div class="mode-banner">
                <div class="mode-left">
                    <div class="mode-dot"></div>
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
                            <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/></svg>
                            Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('rekapitulasi-dana') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><path d="M20 6H9L12 2L4 6H2L7 11L2 16H4L9 12L12 16H14L19 11L14 6H20Z"/></svg>
                            Rekapitulasi Dana
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('manajemen-kampanye') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><path d="M23 19a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2V8a2 2 0 0 1 2-2h4l2-3 6 6h4a2 2 0 0 1 2 2Z"/></svg>
                            Manajemen Kampanye
                        </a>
                    </li>
                    <li>
                        <a href="{{ route('donatur') }}" class="nav-link">
                            <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"/><circle cx="9" cy="7" r="4"/><path d="M23 21v-2a4 4 0 0 0-3-3.87"/><path d="M16 3.13a4 4 0 0 1 0 7.75"/></svg>
                            Donatur
                        </a>
                    </li>
                </ul>
            </div>

            <div class="nav-section">
                <div class="nav-section-title">Admin</div>
                <ul class="nav-list">
                    <li>
                        <a href="{{ route('kelola-akun-operator') }}" class="nav-link active">
                            <svg viewBox="0 0 24 24"><path d="M19 21V5a2 2 0 0 0-2-2H7a2 2 0 0 0-2 2v16m14 0h2m-2 0h-7m-7 0h-3m17 0h-2m-11-4H9m17 0h-2m-9-5V9m-1 5h.01M15 17h.01M12 12h.01M21 12a9 9 0 1 1-18 0 9 9 0 0 1 18 0Z"/></svg>
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
        <div class="main-content">
                        <!-- Top Navbar -->
            <header class="topbar">
                <!-- Search bar -->
                <div class="search-container">
                    <span class="search-icon">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                            <circle cx="11" cy="11" r="8"/>
                            <line x1="21" y1="21" x2="16.65" y2="16.65"/>
                        </svg>
                    </span>
                    <input type="text" class="search-input" placeholder="Cari Apapun...">
                </div>

                <!-- Right Actions -->
                <div class="topbar-right">
                    <!-- Date Filter Dropdown -->
                    <button class="date-picker-btn" type="button">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="3" y="4" width="18" height="18" rx="2" ry="2"/>
                            <line x1="16" y1="2" x2="16" y2="6"/>
                            <line x1="8" y1="2" x2="8" y2="6"/>
                            <line x1="3" y1="10" x2="21" y2="10"/>
                        </svg>
                        <span>30 Hari Terakhir</span>
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="width:12px; height:12px; margin-left:2px;">
                            <polyline points="6 9 12 15 18 9"/>
                        </svg>
                    </button>

                    <!-- Notifications -->
                    <button class="icon-action-btn" type="button" aria-label="Notifikasi">
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/>
                            <path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                        </svg>
                        <span class="notif-badge-dot"></span>
                    </button>

                    <!-- Help -->
                    <button class="help-action-btn" type="button" aria-label="Bantuan">?</button>

                    <!-- Profile -->
                    <div class="profile-pill">
                        <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=120&q=80" alt="Avatar Harry Vaughan" class="profile-avatar">
                        <div class="profile-info">
                            <span class="profile-name">Harry Vaughan</span>
                            <span class="profile-role">Admin</span>
                        </div>
                    </div>
                </div>
            </header>
            <div class="page-content">
                <div class="page-header">
                    <h1 class="page-title">Manajemen Akun Operator</h1>
                </div>

                <div class="stat-grid">
                    <div class="stat-card">
                        <div class="stat-card-label">Total Operator</div>
                        <div class="stat-card-value">98</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-card-label">Ditangguhkan / Pasif</div>
                        <div class="stat-card-value">3</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-card-label">Permohonan Lisensi</div>
                        <div class="stat-card-value">5</div>
                    </div>
                </div>

                <button class="status-filter">Status</button>

                <div class="table-container">
                    <table class="data-table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Operator</th>
                                <th>Terdaftar</th>
                                <th>Sesi Aktif</th>
                                <th>Kampanye</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><span class="operator-id">OP021</span></td>
                                <td><span class="operator-name">Khayra Sakilla</span></td>
                                <td>27 Jan 2024</td>
                                <td>
                                    <div class="session-badge online">
                                        <span class="dot online"></span>
                                        Online
                                    </div>
                                </td>
                                <td>6</td>
                                <td><span class="status-badge aktif">Aktif</span></td>
                            </tr>
                            <tr>
                                <td><span class="operator-id">OP022</span></td>
                                <td><span class="operator-name">Anggun Dewanti</span></td>
                                <td>20 Jan 2025</td>
                                <td>
                                    <div class="session-badge online">
                                        <span class="dot online"></span>
                                        Online
                                    </div>
                                </td>
                                <td>3</td>
                                <td><span class="status-badge aktif">Aktif</span></td>
                            </tr>
                            <tr>
                                <td><span class="operator-id">OP023</span></td>
                                <td><span class="operator-name">Fatma Azzahra</span></td>
                                <td>15 Mar 2025</td>
                                <td>
                                    <div class="session-badge offline">
                                        <span class="dot offline"></span>
                                        18 menit lalu
                                    </div>
                                </td>
                                <td>7</td>
                                <td><span class="status-badge aktif">Aktif</span></td>
                            </tr>
                            <tr>
                                <td><span class="operator-id">OP024</span></td>
                                <td><span class="operator-name">Hosieni Agatha</span></td>
                                <td>17 Apr 2025</td>
                                <td>
                                    <div class="session-badge offline">
                                        <span class="dot offline"></span>
                                        5 jam lalu
                                    </div>
                                </td>
                                <td>2</td>
                                <td><span class="status-badge aktif">Aktif</span></td>
                            </tr>
                            <tr>
                                <td><span class="operator-id">OP025</span></td>
                                <td><span class="operator-name">Yira Saki</span></td>
                                <td>16 Sep 2025</td>
                                <td>
                                    <div class="session-badge offline">
                                        <span class="dot offline"></span>
                                        30 hari lalu
                                    </div>
                                </td>
                                <td>1</td>
                                <td><span class="status-badge ditangguhkan">Ditangguhkan</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="table-footer">
                    <div class="table-info">Menampilkan 5 dari 90 Lainnya</div>
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
