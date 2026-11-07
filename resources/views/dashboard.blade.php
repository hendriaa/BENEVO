<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Dashboard Admin</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>
    <style>
        :root {
            --bg-page: #f2ecfa;
            --bg-sidebar: #ffffff;
            --bg-card: #ffffff;
            --brand-purple: #855cb8;
            --brand-purple-dark: #2d164d;
            --brand-purple-heading: #2d174e;
            --brand-text-dark: #1f1b26;
            --brand-text-muted: #6e727e;
            --brand-border: #ede6f5;
            --accent-green-bg: #daf7e5;
            --accent-green-text: #199447;
            --accent-peach-bg: #fde8db;
            --accent-peach-text: #cb5d2c;
            --accent-gray-bg: #ebe5f5;
            --accent-gray-text: #6c5490;
            --accent-red: #df584f;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Plus Jakarta Sans', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        }

        body {
            background-color: var(--bg-page);
            color: var(--brand-text-dark);
            min-height: 100vh;
            display: flex;
            -webkit-font-smoothing: antialiased;
        }

        /* ----------------- SIDEBAR ----------------- */
        .sidebar {
            width: 275px;
            max-width: 275px;
            background-color: var(--bg-sidebar);
            border-right: 1px solid var(--brand-border);
            display: flex;
            flex-direction: column;
            padding: 28px 20px 24px 20px;
            flex-shrink: 0;
            min-height: 100vh;
            height: 100vh;
            position: sticky;
            top: 0;
            align-self: flex-start;
            overflow-y: auto;
            z-index: 100;
        }

        /* Brand Header */
        .sidebar-brand {
            display: flex;
            align-items: center;
            gap: 12px;
            padding-left: 0;
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

        .brand-gradient {
            background: linear-gradient(90deg, #6d3ca1 0%, #8e6bc6 40%, #c9a227 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
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
            color: #6d3ca1;
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
            color: #6d3ca1;
            margin-top: 2px;
            text-transform: uppercase;
        }

        /* Modus Operasi Banner */
        .mode-banner {
            margin-top: 28px;
            background-color: #f0e8fc;
            border-radius: 12px;
            padding: 12px 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
        }

        .mode-left {
            display: flex;
            align-items: center;
            gap: 10px;
            min-width: 0;
        }

        .mode-dot {
            width: 10px;
            height: 10px;
            background-color: #61389e;
            border-radius: 50%;
            display: inline-block;
            flex-shrink: 0;
        }

        .mode-title {
            font-size: 0.88rem;
            font-weight: 700;
            color: #3b2260;
            line-height: 1.2;
        }

        .mode-sub {
            font-size: 0.76rem;
            color: #6d3ca1;
            font-weight: 500;
            line-height: 1.2;
            margin-top: 2px;
        }

        .mode-badge {
            background-color: #f2d8b4;
            color: #8a5515;
            font-size: 0.72rem;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 6px;
            box-shadow: inset 0 0 0 1px rgba(112, 78, 22, 0.08);
            flex-shrink: 0;
        }

        /* Navigation Links */
        .nav-section {
            margin-top: 28px;
        }

        .nav-section-title {
            font-size: 0.85rem;
            font-weight: 600;
            color: #747783;
            margin-bottom: 12px;
            padding-left: 8px;
        }

        .nav-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 16px;
            border-radius: 10px;
            text-decoration: none;
            font-size: 0.92rem;
            font-weight: 600;
            color: #555966;
            transition: all 0.2s ease;
        }

        .nav-link svg {
            width: 20px;
            height: 20px;
            fill: none;
            stroke: currentColor;
            stroke-width: 2;
            stroke-linecap: round;
            stroke-linejoin: round;
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

        /* ----------------- MAIN WRAPPER ----------------- */
        .main-wrapper {
            flex: 1;
            display: flex;
            flex-direction: column;
            min-width: 0;
            overflow-x: hidden;
        }

        /* Topbar Header */
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

        /* Search input */
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

        /* ----------------- PAGE CONTENT ----------------- */
        .content-area {
            padding: 30px 36px 40px 36px;
            display: flex;
            flex-direction: column;
            gap: 24px;
        }

        .page-title {
            font-size: 2.1rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.025em;
        }

        /* ROW 1: 3 METRIC CARDS */
        .metrics-row {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
        }

        .metric-card {
            background-color: var(--bg-card);
            border-radius: 18px;
            padding: 22px 26px;
            box-shadow: 0 4px 18px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .metric-label {
            font-size: 0.92rem;
            font-weight: 600;
            color: #5c606d;
        }

        .metric-value {
            font-size: 2rem;
            font-weight: 800;
            color: var(--brand-text-dark);
            letter-spacing: -0.03em;
            line-height: 1.1;
        }

        /* ROW 2: CHART + STATS */
        .trend-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            padding: 26px 28px;
            box-shadow: 0 4px 18px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
            animation: cardEntrance 0.8s ease-out both 0.1s;
        }

        .trend-header {
            margin-bottom: 20px;
        }

        .trend-title {
            font-size: 1.55rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.02em;
        }

        .trend-subtitle {
            margin-top: 4px;
            font-size: 0.82rem;
            color: #797d8b;
            font-weight: 500;
        }

        .trend-body {
            display: flex;
            gap: 28px;
            align-items: stretch;
        }

        .chart-box {
            flex: 1 1 70%;
            height: 240px;
            position: relative;
            animation: chartEntrance 1.2s ease-out both;
        }

        @keyframes chartEntrance {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes cardEntrance {
            0% {
                opacity: 0;
                transform: translateY(15px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .trend-side-stats {
            flex: 0 0 240px;
            display: flex;
            flex-direction: column;
            gap: 16px;
            justify-content: center;
        }

        .side-stat-pill {
            background-color: #f7f2fc;
            border-radius: 12px;
            padding: 16px 18px;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .side-stat-top {
            display: flex;
            align-items: center;
            gap: 6px;
            font-size: 0.78rem;
            font-weight: 600;
            color: #6a4f93;
        }

        .side-stat-top svg {
            width: 14px;
            height: 14px;
            stroke-width: 2.2;
        }

        .side-stat-value {
            font-size: 1.45rem;
            font-weight: 800;
            color: #1f1b25;
            letter-spacing: -0.02em;
        }

        /* ROW 3: CAMPAIGNS + RECENT DONATIONS */
        .bottom-row {
            display: grid;
            grid-template-columns: 1.8fr 1.2fr;
            gap: 20px;
        }

        /* Campaign Management Card */
        .campaigns-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            padding: 26px 28px;
            box-shadow: 0 4px 18px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
        }

        .card-heading-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .card-main-title {
            font-size: 1.55rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.02em;
        }

        .campaign-list {
            display: flex;
            flex-direction: column;
            gap: 14px;
            flex: 1;
        }

        .campaign-item {
            background-color: #fbf9fd;
            border: 1px solid #f0e8f8;
            border-radius: 12px;
            padding: 14px 16px;
            display: flex;
            align-items: center;
            gap: 16px;
        }

        .campaign-thumb {
            width: 52px;
            height: 52px;
            border-radius: 10px;
            object-fit: cover;
            flex-shrink: 0;
            background-color: #e5daf3;
        }

        .campaign-content {
            flex: 1;
            min-width: 0;
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .campaign-title-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 8px;
        }

        .campaign-name {
            font-size: 0.96rem;
            font-weight: 700;
            color: #211e28;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .status-pill {
            font-size: 0.72rem;
            font-weight: 700;
            padding: 2px 8px;
            border-radius: 6px;
            flex-shrink: 0;
        }

        .status-pill.active {
            background-color: var(--accent-green-bg);
            color: var(--accent-green-text);
        }

        .status-pill.done {
            background-color: var(--accent-gray-bg);
            color: var(--accent-gray-text);
        }

        .status-pill.frozen {
            background-color: var(--accent-peach-bg);
            color: var(--accent-peach-text);
        }

        .campaign-meta {
            font-size: 0.78rem;
            color: #797d8b;
            font-weight: 500;
        }

        .campaign-progress-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 4px;
            font-size: 0.8rem;
            font-weight: 700;
        }

        .progress-collected {
            color: #6a40a8;
        }

        .progress-target {
            color: #797c88;
            font-weight: 600;
        }

        .progress-rate {
            color: #6a40a8;
        }

        .progress-rate.frozen-warn {
            color: #e25b52;
            display: flex;
            align-items: center;
            gap: 4px;
        }

        .progress-bar-wrap {
            width: 100%;
            height: 6px;
            background-color: #ede4f7;
            border-radius: 9999px;
            overflow: hidden;
            margin-top: 5px;
        }

        .progress-bar-fill {
            height: 100%;
            border-radius: 9999px;
            background-color: var(--brand-purple);
        }

        .progress-bar-fill.red {
            background-color: #e25b52;
        }

        /* Recent Donations Card */
        .donations-card {
            background-color: var(--bg-card);
            border-radius: 20px;
            padding: 26px 24px;
            box-shadow: 0 4px 18px rgba(100, 60, 150, 0.05);
            display: flex;
            flex-direction: column;
        }

        .donations-header {
            display: flex;
            align-items: center;
            gap: 8px;
            font-size: 1.15rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            margin-bottom: 18px;
        }

        .donations-header svg {
            width: 20px;
            height: 20px;
            color: var(--brand-purple);
        }

        .donation-list {
            display: flex;
            flex-direction: column;
            gap: 16px;
            flex: 1;
        }

        .donation-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 12px;
        }

        .donor-left {
            display: flex;
            align-items: center;
            gap: 12px;
            min-width: 0;
        }

        .donor-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            flex-shrink: 0;
        }

        .donor-avatar-anon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

        .donor-avatar-anon.peach {
            background-color: #ffd8cc;
            color: #d15c38;
        }

        .donor-avatar-anon.blue {
            background-color: #388bfd;
            color: #ffffff;
        }

        .donor-info {
            display: flex;
            flex-direction: column;
            min-width: 0;
        }

        .donor-name {
            font-size: 0.9rem;
            font-weight: 700;
            color: #211e28;
            line-height: 1.2;
        }

        .donor-campaign {
            font-size: 0.72rem;
            color: #797d8b;
            font-weight: 500;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            max-width: 170px;
        }

        .donor-right {
            text-align: right;
            flex-shrink: 0;
        }

        .donation-amount {
            font-size: 0.92rem;
            font-weight: 800;
            color: #1f1b26;
            line-height: 1.2;
        }

        .donation-time {
            font-size: 0.7rem;
            color: #9295a1;
            font-weight: 500;
        }

        /* Card Footers */
        .card-footer-link {
            margin-top: 18px;
            display: flex;
            align-items: center;
            justify-content: flex-end;
            gap: 6px;
            text-decoration: none;
            color: #6a40a8;
            font-size: 0.86rem;
            font-weight: 700;
            transition: color 0.15s;
        }

        .card-footer-link:hover {
            color: #4b2680;
        }

        .card-footer-link svg {
            width: 15px;
            height: 15px;
        }

        /* Responsive */
        @media (max-width: 1200px) {
            .bottom-row {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 992px) {
            body {
                flex-direction: column;
            }

            /* Sidebar berubah menjadi top bar horizontal */
            .sidebar {
                width: 100%;
                max-width: 100%;
                max-height: none;
                overflow-y: visible;
                min-height: auto;
                padding: 20px;
                border-right: none;
                border-bottom: 1px solid var(--brand-border);
            }

            .mode-banner {
                margin-top: 20px;
            }

            .nav-section {
                margin-top: 20px;
            }

            .nav-list {
                flex-direction: row;
                flex-wrap: wrap;
                gap: 8px;
            }

            .nav-link {
                padding: 10px 14px;
            }

            .metrics-row {
                grid-template-columns: 1fr;
            }

            .trend-body {
                flex-direction: column;
            }

            .trend-side-stats {
                flex: none;
            }
        }

        @media (max-width: 640px) {
            .topbar {
                height: auto;
                flex-wrap: wrap;
                padding: 14px 20px;
                gap: 12px;
            }

            .search-container {
                max-width: 100%;
                order: 3;
                width: 100%;
            }

            .content-area {
                padding: 20px;
            }

            .topbar-right {
                gap: 10px;
                flex-wrap: wrap;
            }

            .date-picker-btn span {
                display: none;
            }

            .profile-info {
                display: none;
            }

            .donation-item,
            .campaign-item {
                align-items: flex-start;
            }

            .donor-campaign {
                max-width: 120px;
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

    <!-- ---------------- SIDEBAR ---------------- -->
    <aside class="sidebar">
        <!-- Brand Logo & Wordmark -->
        <a href="{{ route('dashboard') }}" class="sidebar-brand">
            <div class="brand-logo-badge" aria-hidden="true">
            <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
        </div>
            <div class="brand-text-block">
                <div class="brand-wordmark-wrap">
                    <span class="brand-wordmark brand-gradient">Benevo</span>
                    <span class="brand-yellow-dot" aria-hidden="true"></span>
                </div>
                <span class="brand-platform-sub">CMS PLATFORM</span>
            </div>
        </a>

        <!-- Modus Operasi Banner -->
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

        <!-- Section: Menu Utama -->
        <div class="nav-section">
            <div class="nav-section-title">Menu Utama</div>
            <ul class="nav-list">
                <li>
                    <a href="{{ route('dashboard') }}" class="nav-link active">
                        <!-- Dashboard Grid Icon -->
                        <svg viewBox="0 0 24 24">
                            <rect x="3" y="3" width="7" height="7" rx="1.5"/>
                            <rect x="14" y="3" width="7" height="7" rx="1.5"/>
                            <rect x="14" y="14" width="7" height="7" rx="1.5"/>
                            <rect x="3" y="14" width="7" height="7" rx="1.5"/>
                        </svg>
                        Dashboard
                    </a>
                </li>
                <li>
                    <a href="{{ route('rekapitulasi-dana') }}" class="nav-link">
                        <!-- Rekapitulasi Dana / Wallet Icon -->
                        <svg viewBox="0 0 24 24">
                            <path d="M21 12V7H5a2 2 0 0 1 0-4h14v4"/>
                            <path d="M3 5v14a2 2 0 0 0 2 2h16v-5"/>
                            <path d="M18 12a2 2 0 0 0 0 4h4v-4z"/>
                        </svg>
                        Rekapitulasi Dana
                    </a>
                </li>
                <li>
                    <a href="{{ route('manajemen-kampanye') }}" class="nav-link">
                        <!-- Manajemen Kampanye / Megaphone Icon -->
                        <svg viewBox="0 0 24 24">
                            <path d="M3 11l18-5v12L3 14v-3z"/>
                            <path d="M11.6 16.8a3 3 0 1 1-5.8-1.6"/>
                        </svg>
                        Manajemen Kampanye
                    </a>
                </li>
                <li>
                    <a href="{{ route('donatur') }}" class="nav-link">
                        <!-- Donatur / Users Icon -->
                        <svg viewBox="0 0 24 24">
                            <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2"/>
                            <circle cx="9" cy="7" r="4"/>
                            <path d="M22 21v-2a4 4 0 0 0-3-3.87"/>
                            <path d="M16 3.13a4 4 0 0 1 0 7.75"/>
                        </svg>
                        Donatur
                    </a>
                </li>
            </ul>
        </div>

        <!-- Section: Admin -->
        <div class="nav-section">
            <div class="nav-section-title">Admin</div>
            <ul class="nav-list">
                <li>
                    <a href="{{ route('kelola-akun-operator') }}" class="nav-link">
                        <!-- Kelola Akun Operator / Settings Icon -->
                        <svg viewBox="0 0 24 24">
                            <path d="M12.22 2h-.44a2 2 0 0 0-2 2v.18a2 2 0 0 1-1 1.73l-.43.25a2 2 0 0 1-2 0l-.15-.08a2 2 0 0 0-2.73.73l-.22.38a2 2 0 0 0 .73 2.73l.15.1a2 2 0 0 1 1 1.72v.51a2 2 0 0 1-1 1.74l-.15.09a2 2 0 0 0-.73 2.73l.22.38a2 2 0 0 0 2.73.73l.15-.08a2 2 0 0 1 2 0l.43.25a2 2 0 0 1 1 1.73V20a2 2 0 0 0 2 2h.44a2 2 0 0 0 2-2v-.18a2 2 0 0 1 1-1.73l.43-.25a2 2 0 0 1 2 0l.15.08a2 2 0 0 0 2.73-.73l.22-.39a2 2 0 0 0-.73-2.73l-.15-.08a2 2 0 0 1-1-1.74v-.5a2 2 0 0 1 1-1.74l.15-.09a2 2 0 0 0 .73-2.73l-.22-.38a2 2 0 0 0-2.73-.73l-.15.08a2 2 0 0 1-2 0l-.43-.25a2 2 0 0 1-1-1.73V4a2 2 0 0 0-2-2z"/>
                            <circle cx="12" cy="12" r="3"/>
                        </svg>
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

    <!-- ---------------- MAIN CONTENT WRAPPER ---------------- -->
    <div class="main-wrapper">
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

        <!-- Page Main Content -->
        <main class="content-area">
            <h1 class="page-title">Dashboard</h1>

            <!-- ROW 1: 3 METRIC CARDS -->
            <div class="metrics-row">
                <div class="metric-card">
                    <div class="metric-label">Total Dana Terkumpul</div>
                    <div class="metric-value">Rp 689.721.095</div>
                </div>
                <div class="metric-card">
                    <div class="metric-label">Jumlah Kampanye</div>
                    <div class="metric-value">412</div>
                </div>
                <div class="metric-card">
                    <div class="metric-label">Jumlah Donatur</div>
                    <div class="metric-value">755.248</div>
                </div>
            </div>

            <!-- ROW 2: CHART + STATS -->
            <div class="trend-card">
                <div class="trend-header">
                    <h2 class="trend-title">Tren Perolehan Donasi</h2>
                    <p class="trend-subtitle">kurva pertumbuhan modalitas donasi sosial per periode harian Oktober 2026</p>
                </div>
                <div class="trend-body">
                    <!-- Area Chart Box -->
                    <div class="chart-box">
                        <canvas id="donationChart"></canvas>
                    </div>

                    <!-- Right Summary Pills -->
                    <div class="trend-side-stats">
                        <div class="side-stat-pill">
                            <div class="side-stat-top">
                                <!-- Trending Up Icon -->
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                                    <polyline points="23 6 13.5 15.5 8.5 10.5 1 18"/>
                                    <polyline points="17 6 23 6 23 12"/>
                                </svg>
                                <span>Rata-rata donasi harian</span>
                            </div>
                            <div class="side-stat-value">Rp2.567.091</div>
                        </div>

                        <div class="side-stat-pill">
                            <div class="side-stat-top">
                                <!-- Analytics Trend Icon -->
                                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round">
                                    <circle cx="11" cy="11" r="8"/>
                                    <line x1="21" y1="21" x2="16.65" y2="16.65"/>
                                    <polyline points="8 11 10 13 14 9"/>
                                </svg>
                                <span>Rata-rata donasi sebulan</span>
                            </div>
                            <div class="side-stat-value">Rp15.901.374</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- ROW 3: CAMPAIGNS + RECENT DONATIONS -->
            <div class="bottom-row">
                <!-- Left: Manajemen Kampanye -->
                <div class="campaigns-card">
                    <div class="card-heading-row">
                        <h2 class="card-main-title">Manajemen Kampanye</h2>
                    </div>

                    <div class="campaign-list">
                        <!-- Campaign 1 -->
                        <div class="campaign-item">
                            <img src="https://images.unsplash.com/photo-1542601906990-b4d3fb778b09?auto=format&fit=crop&w=150&q=80" alt="Karhutla" class="campaign-thumb">
                            <div class="campaign-content">
                                <div class="campaign-title-row">
                                    <span class="campaign-name">Bantu padamkan Karhutla</span>
                                    <span class="status-pill active">Aktif</span>
                                </div>
                                <div class="campaign-meta">Bencana Alam • Darurat • 30/10/2026</div>
                                <div class="campaign-progress-row">
                                    <div>
                                        <span class="progress-collected">Rp 389.708.651</span>
                                        <span class="progress-target">/ Rp 500.000.000</span>
                                    </div>
                                    <span class="progress-rate">67%</span>
                                </div>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar-fill" style="width: 67%;"></div>
                                </div>
                            </div>
                        </div>

                        <!-- Campaign 2 -->
                        <div class="campaign-item">
                            <img src="https://images.unsplash.com/photo-1582213782179-e0d53f98f2ca?auto=format&fit=crop&w=150&q=80" alt="Gempa NTT" class="campaign-thumb">
                            <div class="campaign-content">
                                <div class="campaign-title-row">
                                    <span class="campaign-name">Bantuan Korban Gempa NTT</span>
                                    <span class="status-pill done">Selesai</span>
                                </div>
                                <div class="campaign-meta">Bencana Alam • 10/10/2026</div>
                                <div class="campaign-progress-row">
                                    <div>
                                        <span class="progress-collected">Rp 115.075.214</span>
                                        <span class="progress-target">/ Rp 100.000.000</span>
                                    </div>
                                    <span class="progress-rate">100%</span>
                                </div>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar-fill" style="width: 100%;"></div>
                                </div>
                            </div>
                        </div>

                        <!-- Campaign 3 -->
                        <div class="campaign-item">
                            <img src="https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b?auto=format&fit=crop&w=150&q=80" alt="Kanker Otak Adik Alya" class="campaign-thumb">
                            <div class="campaign-content">
                                <div class="campaign-title-row">
                                    <span class="campaign-name">Operasi kanker otak adik Alya</span>
                                    <span class="status-pill frozen">Beku</span>
                                </div>
                                <div class="campaign-meta">Medis • 16/10/2026</div>
                                <div class="campaign-progress-row">
                                    <div>
                                        <span class="progress-collected" style="color: #e25b52;">Rp 35.310.694</span>
                                        <span class="progress-target">/ Rp 70.000.000</span>
                                    </div>
                                    <span class="progress-rate frozen-warn">
                                        Ditangguhkan
                                        <svg viewBox="0 0 24 24" width="14" height="14" fill="currentColor">
                                            <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm1 15h-2v-2h2v2zm0-4h-2V7h2v6z"/>
                                        </svg>
                                    </span>
                                </div>
                                <div class="progress-bar-wrap">
                                    <div class="progress-bar-fill red" style="width: 50%;"></div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a href="#" class="card-footer-link">
                        <span>Lihat selengkapnya</span>
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="5" y1="12" x2="19" y2="12"/>
                            <polyline points="12 5 19 12 12 19"/>
                        </svg>
                    </a>
                </div>

                <!-- Right: Donasi Masuk Terkini -->
                <div class="donations-card">
                    <div class="donations-header">
                        <!-- Money Spark Icon -->
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                            <rect x="2" y="6" width="20" height="12" rx="2"/>
                            <circle cx="12" cy="12" r="2"/>
                            <path d="M6 12h.01M18 12h.01"/>
                        </svg>
                        <span>Donasi Masuk Terkini</span>
                    </div>

                    <div class="donation-list">
                        <!-- Donation 1 -->
                        <div class="donation-item">
                            <div class="donor-left">
                                <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=120&q=80" alt="John Duck" class="donor-avatar">
                                <div class="donor-info">
                                    <span class="donor-name">John Duck</span>
                                    <span class="donor-campaign">Bencana Alam - Darurat</span>
                                </div>
                            </div>
                            <div class="donor-right">
                                <div class="donation-amount">+5.000.000</div>
                                <div class="donation-time">2 menit lalu</div>
                            </div>
                        </div>

                        <!-- Donation 2 -->
                        <div class="donation-item">
                            <div class="donor-left">
                                <img src="https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=120&q=80" alt="Mia Mora" class="donor-avatar">
                                <div class="donor-info">
                                    <span class="donor-name">Mia Mora</span>
                                    <span class="donor-campaign">Bantu Pemadaman Karhutla - Bencana Alam</span>
                                </div>
                            </div>
                            <div class="donor-right">
                                <div class="donation-amount">+450.000</div>
                                <div class="donation-time">2 menit lalu</div>
                            </div>
                        </div>

                        <!-- Donation 3 -->
                        <div class="donation-item">
                            <div class="donor-left">
                                <div class="donor-avatar-anon peach">
                                    <svg viewBox="0 0 24 24" width="22" height="22" fill="currentColor">
                                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                                    </svg>
                                </div>
                                <div class="donor-info">
                                    <span class="donor-name">Anonymous</span>
                                    <span class="donor-campaign">Bantuan Korban NTT - Bencana Alam</span>
                                </div>
                            </div>
                            <div class="donor-right">
                                <div class="donation-amount">+920.000</div>
                                <div class="donation-time">5 menit lalu</div>
                            </div>
                        </div>

                        <!-- Donation 4 -->
                        <div class="donation-item">
                            <div class="donor-left">
                                <div class="donor-avatar-anon blue">
                                    <svg viewBox="0 0 24 24" width="22" height="22" fill="currentColor">
                                        <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 3c1.66 0 3 1.34 3 3s-1.34 3-3 3-3-1.34-3-3 1.34-3 3-3zm0 14.2c-2.5 0-4.71-1.28-6-3.22.03-1.99 4-3.08 6-3.08 1.99 0 5.97 1.09 6 3.08-1.29 1.94-3.5 3.22-6 3.22z"/>
                                    </svg>
                                </div>
                                <div class="donor-info">
                                    <span class="donor-name">Anonymous</span>
                                    <span class="donor-campaign">Bantuan Korban NTT - Bencana Alam</span>
                                </div>
                            </div>
                            <div class="donor-right">
                                <div class="donation-amount">+25.000</div>
                                <div class="donation-time">7 menit lalu</div>
                            </div>
                        </div>
                    </div>

                    <a href="#" class="card-footer-link">
                        <span>Detail transaksi</span>
                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round">
                            <line x1="5" y1="12" x2="19" y2="12"/>
                            <polyline points="12 5 19 12 12 19"/>
                        </svg>
                    </a>
                </div>
            </div>
        </main>
    </div>

    <!-- Chart.js Configuration -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const ctx = document.getElementById('donationChart').getContext('2d');

            // Create smooth purple area gradient
            const gradient = ctx.createLinearGradient(0, 0, 0, 240);
            gradient.addColorStop(0, 'rgba(142, 98, 198, 0.75)');
            gradient.addColorStop(0.6, 'rgba(142, 98, 198, 0.50)');
            gradient.addColorStop(1, 'rgba(142, 98, 198, 0.15)');

            new Chart(ctx, {
                type: 'line',
                data: {
                    labels: ['1 Oct', '2 Oct', '3 Oct', '4 Oct', '5 Oct', '6 Oct', '7 Oct', '8 Oct', '9 Oct', '10 Oct'],
                    datasets: [{
                        label: 'Donasi Harian',
                        data: [23, 6, 26, 17, 21, 29, 25, 24, 34, 15],
                        borderColor: '#855cb8',
                        borderWidth: 2.2,
                        backgroundColor: gradient,
                        fill: true,
                        tension: 0.35,
                        pointBackgroundColor: '#855cb8',
                        pointBorderColor: '#ffffff',
                        pointBorderWidth: 1.5,
                        pointRadius: 4,
                        pointHoverRadius: 6,
                        pointHoverBackgroundColor: '#6736a4',
                        pointHoverBorderColor: '#ffffff',
                        pointHoverBorderWidth: 2
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    animation: {
                        duration: 2000,
                        easing: 'easeInOutQuart'
                    },
                    plugins: {
                        legend: { display: false },
                        tooltip: {
                            backgroundColor: '#2b144b',
                            titleFont: { family: 'Plus Jakarta Sans', size: 12, weight: '700' },
                            bodyFont: { family: 'Plus Jakarta Sans', size: 13, weight: '600' },
                            padding: 10,
                            cornerRadius: 8,
                            callbacks: {
                                label: function(context) {
                                    return ' Donasi: Rp ' + (context.raw * 100000).toLocaleString('id-ID');
                                }
                            }
                        }
                    },
                    scales: {
                        x: {
                            grid: {
                                color: 'rgba(230, 220, 245, 0.6)',
                                drawBorder: false
                            },
                            ticks: {
                                color: '#686b76',
                                font: {
                                    family: 'Plus Jakarta Sans',
                                    size: 11,
                                    weight: '600'
                                }
                            }
                        },
                        y: {
                            display: true,
                            grid: {
                                color: 'rgba(230, 220, 245, 0.6)',
                                drawBorder: false
                            },
                            ticks: {
                                display: false
                            },
                            min: 0,
                            max: 38
                        }
                    }
                }
            });
        });
    </script>

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

