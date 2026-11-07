<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Benevo CMS Platform - Detail Pengajuan Kampanye</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="icon" type="image/png" href="{{ asset('images/benevo-logo.png') }}">
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

        /* ========== SIDEBAR ========== */
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

        .sidebar::-webkit-scrollbar {
            width: 4px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background: #e5daf3;
            border-radius: 4px;
        }

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

        .brand-logo-badge img {
            width: 100%;
            height: 100%;
            display: block;
            object-fit: contain;
        }

        .brand-text-block {
            display: flex;
            flex-direction: column;
        }

        .brand-wordmark-wrap {
            position: relative;
            display: inline-flex;
            align-items: center;
        }

        .brand-wordmark {
            font-size: 1.65rem;
            font-weight: 800;
            letter-spacing: -0.025em;
            line-height: 1;
        }

        .brand-gradient {
            background: linear-gradient(90deg, 
                #502b8d 0%, 
                #593393 20%, 
                #724da0 38%, 
                #9670b3 56%, 
                #b695b3 68%, 
                #cbb082 82%, 
                #ead45e 100%
            );
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .brand-yellow-dot {
            position: absolute;
            top: 1px;
            right: -10px;
            width: 7px;
            height: 7px;
            background-color: #f6e474;
            border-radius: 50%;
        }

        .brand-platform-sub {
            font-size: 0.65rem;
            font-weight: 800;
            letter-spacing: 0.08em;
            color: #796696;
            margin-top: 3px;
            text-transform: uppercase;
        }

        /* Modus Operasi */
        .mode-banner {
            margin-top: 24px;
            background-color: #f0e8fc;
            border-radius: 12px;
            padding: 12px 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .mode-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .mode-dot {
            width: 10px;
            height: 10px;
            background-color: #6a3ab2;
            border-radius: 50%;
        }

        .mode-title {
            font-size: 0.88rem;
            font-weight: 700;
            color: #3b2260;
            line-height: 1.2;
        }

        .mode-sub {
            font-size: 0.76rem;
            color: #7d6b97;
            font-weight: 500;
        }

        .mode-badge {
            background-color: var(--accent-peach-bg);
            color: var(--accent-peach-text);
            font-size: 0.72rem;
            font-weight: 700;
            padding: 3px 8px;
            border-radius: 6px;
        }

        /* Navigation Links */
        .nav-section {
            margin-top: 24px;
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

        /* Sidebar Footer Logout */
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

        /* ========== MAIN WRAPPER ========== */
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

        /* ========== CONTENT AREA ========== */
        .content-area {
            padding: 30px 36px 40px 36px;
            display: flex;
            flex-direction: column;
            gap: 22px;
        }

        .page-title {
            font-size: 2.1rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.025em;
        }

        /* Filter Pills Row */
        .filter-pills-row {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .pill-btn-active {
            background-color: #5c3899;
            color: #ffffff;
            border: none;
            padding: 8px 20px;
            border-radius: 9999px;
            font-size: 0.88rem;
            font-weight: 700;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
        }

        .pill-dropdown-btn {
            background-color: #ece4fa;
            color: #5c3899;
            border: none;
            padding: 8px 18px;
            border-radius: 9999px;
            font-size: 0.88rem;
            font-weight: 700;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            gap: 6px;
        }

        .pill-dropdown-btn svg {
            width: 13px;
            height: 13px;
            stroke: currentColor;
            fill: none;
            stroke-width: 2.5;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        /* Detail Card */
        .detail-card {
            background-color: var(--bg-card);
            border-radius: 24px;
            padding: 34px 38px 36px 38px;
            box-shadow: 0 4px 20px rgba(100, 60, 150, 0.07);
            max-width: 900px;
            display: flex;
            flex-direction: column;
            gap: 22px;
        }

        .detail-card-title {
            font-size: 1.65rem;
            font-weight: 800;
            color: var(--brand-purple-heading);
            letter-spacing: -0.02em;
            margin-bottom: 6px;
        }

        /* Checklist Row Item */
        .checklist-item {
            display: flex;
            align-items: flex-start;
            gap: 16px;
        }

        /* Custom Checkbox */
        .check-box-icon {
            width: 22px;
            height: 22px;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            margin-top: 3px;
        }

        .check-box-icon.checked {
            background-color: #5c3899;
            color: #ffffff;
        }

        .check-box-icon.checked svg {
            width: 14px;
            height: 14px;
            stroke: #ffffff;
            stroke-width: 3;
            fill: none;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .check-box-icon.unchecked {
            background-color: #ffffff;
            border: 2px solid #cfc5e8;
        }

        /* Item Content Block */
        .item-content {
            flex: 1;
            display: flex;
            flex-direction: column;
            gap: 6px;
        }

        .item-label {
            font-size: 0.85rem;
            font-weight: 600;
            color: #4b3e64;
        }

        .item-value-bold {
            font-size: 1.15rem;
            font-weight: 800;
            color: #1f1a29;
            letter-spacing: -0.01em;
        }

        /* Lavender Box Input / Content */
        .lavender-pill-box {
            background-color: #ece4fa;
            border-radius: 10px;
            padding: 9px 18px;
            width: fit-content;
            min-width: 260px;
            font-size: 0.95rem;
            font-weight: 600;
            color: #1f1b26;
        }

        .lavender-desc-box {
            background-color: #ece4fa;
            border-radius: 14px;
            padding: 16px 20px;
            max-width: 640px;
            font-size: 0.85rem;
            line-height: 1.6;
            color: #2b2734;
            font-weight: 500;
        }

        .evidence-image-wrap {
            border-radius: 14px;
            overflow: hidden;
            width: 440px;
            max-width: 100%;
            box-shadow: 0 4px 14px rgba(0, 0, 0, 0.08);
        }

        .evidence-image-wrap img {
            width: 100%;
            height: auto;
            display: block;
            object-fit: cover;
        }

        /* Dates row */
        .dates-container {
            display: flex;
            align-items: center;
            gap: 24px;
            flex-wrap: wrap;
        }

        .date-box-col {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .date-sublabel {
            font-size: 0.75rem;
            font-weight: 700;
            color: #3d3254;
        }

        .date-pill-input {
            background-color: #ece4fa;
            border-radius: 10px;
            padding: 8px 14px;
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 0.88rem;
            font-weight: 600;
            color: #211c2b;
        }

        .date-pill-input svg {
            width: 16px;
            height: 16px;
            stroke: #4b3e64;
            stroke-width: 2;
            fill: none;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        /* Document file cards */
        .documents-container {
            display: flex;
            align-items: center;
            gap: 14px;
            margin-top: 4px;
        }

        .doc-file-card {
            background-color: #ece4fa;
            width: 82px;
            height: 86px;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 6px;
            text-decoration: none;
            transition: all 0.15s ease;
            cursor: pointer;
        }

        .doc-file-card:hover {
            background-color: #e2d6f5;
            transform: translateY(-2px);
        }

        .doc-file-icon {
            width: 28px;
            height: 32px;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .doc-file-icon svg {
            width: 100%;
            height: 100%;
            fill: #5c3899;
        }

        .doc-file-name {
            font-size: 0.72rem;
            font-weight: 700;
            color: #3b2e55;
        }

        /* Inspection Bar */
        .inspection-section {
            margin-top: 14px;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }

        .inspection-status-text {
            text-align: right;
            font-size: 0.88rem;
            font-weight: 600;
            color: #4b4458;
        }

        .inspection-progress-track {
            width: 100%;
            height: 9px;
            background-color: #e5daf3;
            border-radius: 99px;
            overflow: hidden;
        }

        .inspection-progress-fill {
            height: 100%;
            width: 80%;
            background-color: #5c3899;
            border-radius: 99px;
        }

        /* Action Buttons Row */
        .detail-actions-row {
            display: flex;
            align-items: center;
            gap: 16px;
            margin-top: 20px;
        }

        .btn-action-setujui {
            flex: 1;
            height: 50px;
            background-color: #4a2d82;
            color: #ffffff;
            border: none;
            border-radius: 12px;
            font-size: 1.05rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            box-shadow: 0 4px 14px rgba(74, 45, 130, 0.25);
        }

        .btn-action-setujui:hover {
            background-color: #3b2169;
            transform: translateY(-1px);
        }

        .btn-action-tolak {
            flex: 1;
            height: 50px;
            background-color: #df5353;
            color: #ffffff;
            border: none;
            border-radius: 12px;
            font-size: 1.05rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 14px rgba(223, 83, 83, 0.25);
        }

        .btn-action-tolak:hover {
            background-color: #c94040;
            transform: translateY(-1px);
        }

        /* ================= REJECT MODAL (IMAGE 4) ================= */
        .reject-modal-backdrop {
            position: fixed;
            inset: 0;
            background: rgba(30, 20, 50, 0.48);
            backdrop-filter: blur(3px);
            -webkit-backdrop-filter: blur(3px);
            z-index: 999999;
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            visibility: hidden;
            transition: opacity 0.25s ease, visibility 0.25s ease;
        }

        .reject-modal-backdrop.show {
            opacity: 1;
            visibility: visible;
        }

        .reject-modal-card {
            background: #ffffff;
            width: 90%;
            max-width: 500px;
            border-radius: 24px;
            padding: 34px 34px 30px 34px;
            box-shadow: 0 25px 60px -10px rgba(0, 0, 0, 0.25);
            display: flex;
            flex-direction: column;
            gap: 16px;
            transform: scale(0.92);
            transition: transform 0.25s cubic-bezier(0.34, 1.56, 0.64, 1);
        }

        .reject-modal-backdrop.show .reject-modal-card {
            transform: scale(1);
        }

        .reject-modal-title {
            font-size: 1.25rem;
            font-weight: 800;
            color: #1f1a26;
            line-height: 1.35;
        }

        .reject-modal-campaign-name {
            font-size: 1.15rem;
            font-weight: 800;
            color: #5c3899;
            line-height: 1.3;
        }

        .reject-modal-reason-label {
            font-size: 1rem;
            font-weight: 700;
            color: #5c3899;
            margin-top: 4px;
        }

        .reject-modal-textarea {
            width: 100%;
            min-height: 105px;
            border-radius: 14px;
            border: 1.5px solid #c8b7e8;
            padding: 14px 16px;
            font-family: inherit;
            font-size: 0.95rem;
            color: #1f1b26;
            outline: none;
            resize: none;
            line-height: 1.45;
            transition: border-color 0.2s ease;
        }

        .reject-modal-textarea:focus {
            border-color: #5c3899;
            box-shadow: 0 0 0 3px rgba(92, 56, 153, 0.15);
        }

        .btn-confirm-reject {
            width: 100%;
            height: 52px;
            border-radius: 14px;
            border: none;
            background-color: #d94545;
            color: #ffffff;
            font-size: 1.15rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 4px 14px rgba(217, 69, 69, 0.3);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn-confirm-reject:hover {
            background-color: #c43333;
            transform: translateY(-1px);
        }

        /* Logout Modal */
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
    </style>
</head>
<body>

<!-- ========== SIDEBAR ========== -->
<aside class="sidebar">
    <!-- Brand Logo -->
    <a href="{{ route('dashboard') }}" class="sidebar-brand">
        <div class="brand-logo-badge">
            <img src="{{ asset('images/benevo-logo.png') }}" alt="Benevo Logo">
        </div>
        <div class="brand-text-block">
            <div class="brand-wordmark-wrap">
                <span class="brand-wordmark brand-gradient">Benevo</span>
                <span class="brand-yellow-dot"></span>
            </div>
            <span class="brand-platform-sub">CMS PLATFORM</span>
        </div>
    </a>

    <!-- Modus Operasi -->
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
    <nav class="nav-section">
        <div class="nav-section-title">Menu Utama</div>
        <ul class="nav-list">
            <li>
                <a href="{{ route('dashboard') }}" class="nav-link">
                    <svg viewBox="0 0 24 24"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
                    Dashboard
                </a>
            </li>
            <li>
                <a href="{{ route('rekapitulasi-dana') }}" class="nav-link">
                    <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"/><polyline points="14 2 14 8 20 8"/><line x1="16" y1="13" x2="8" y2="13"/><line x1="16" y1="17" x2="8" y2="17"/><polyline points="10 9 9 9 8 9"/></svg>
                    Rekaptulasi Dana
                </a>
            </li>
            <li>
                <a href="{{ route('manajemen-kampanye') }}" class="nav-link active">
                    <svg viewBox="0 0 24 24"><path d="M22 12h-4l-3 9L9 3l-3 9H2"/></svg>
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
    </nav>

    <!-- Admin Section -->
    <nav class="nav-section">
        <div class="nav-section-title">Admin</div>
        <ul class="nav-list">
            <li>
                <a href="{{ route('kelola-akun-operator') }}" class="nav-link">
                    <svg viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 20c0-4 3.6-7 8-7s8 3 8 7"/><circle cx="19" cy="8" r="2" fill="currentColor" stroke="none" opacity="0.5"/><path d="M22 13.5c-1-1-2.5-1.5-3-1.5" stroke-width="1.5"/></svg>
                    Kelola Akun Operator
                </a>
            </li>
        </ul>
    </nav>

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

<!-- ========== MAIN WRAPPER ========== -->
<div class="main-wrapper">

    <!-- Topbar -->
    <header class="topbar">
        <div class="search-container">
            <span class="search-icon">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"/><line x1="21" y1="21" x2="16.65" y2="16.65"/>
                </svg>
            </span>
            <input type="text" class="search-input" placeholder="Cari Apapun...">
        </div>

        <div class="topbar-right">
            <button class="date-picker-btn" type="button">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/>
                </svg>
                <span>30 Hari Terakhir</span>
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round" style="width:13px;height:13px;margin-left:2px;">
                    <polyline points="6 9 12 15 18 9"/>
                </svg>
            </button>

            <button class="icon-action-btn" type="button" aria-label="Notifikasi">
                <span class="notif-badge-dot"></span>
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"/><path d="M13.73 21a2 2 0 0 1-3.46 0"/>
                </svg>
            </button>

            <button class="help-action-btn" type="button" aria-label="Bantuan">?</button>

            <div class="profile-pill">
                <img src="https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=120&q=80" alt="Avatar Harry Vaughan" class="profile-avatar">
                <div class="profile-info">
                    <span class="profile-name">Harry Vaughan</span>
                    <span class="profile-role">Admin</span>
                </div>
            </div>
        </div>
    </header>

    <!-- Main Content -->
    <main class="content-area">
        <h1 class="page-title">Pengajuan Kampanye</h1>

        <!-- Filter Pills -->
        <div class="filter-pills-row">
            <a href="{{ route('pengajuan-kampanye') }}" class="pill-btn-active">Semua</a>
            <button type="button" class="pill-dropdown-btn">
                <span>Kategori</span>
                <svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"/></svg>
            </button>
        </div>

        <!-- Detail Card -->
        <div class="detail-card">
            <h2 class="detail-card-title">Detail Pengajuan Kampanye</h2>

            <!-- Item 1: Pengaju -->
            <div class="checklist-item">
                <div class="check-box-icon checked">
                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div class="item-content">
                    <span class="item-label">Pengaju</span>
                    <span class="item-value-bold">Vinka Fatma</span>
                </div>
            </div>

            <!-- Item 2: Dokumentasi gambar Bukti -->
            <div class="checklist-item">
                <div class="check-box-icon unchecked"></div>
                <div class="item-content">
                    <span class="item-label">Dokumentasi gambar Bukti</span>
                    <div class="evidence-image-wrap">
                        <img src="{{ asset('images/fontaine-evidence.png') }}" alt="Dokumentasi Banjir Fontaine">
                    </div>
                </div>
            </div>

            <!-- Item 3: Judul -->
            <div class="checklist-item">
                <div class="check-box-icon checked">
                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div class="item-content">
                    <span class="item-label">Judul</span>
                    <span class="item-value-bold">Bantu Korban Banjir Bandang Fontaine</span>
                </div>
            </div>

            <!-- Item 4: Kategori -->
            <div class="checklist-item">
                <div class="check-box-icon checked">
                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div class="item-content">
                    <span class="item-label">Kategori</span>
                    <div class="lavender-pill-box">Bencana Alam</div>
                </div>
            </div>

            <!-- Item 5: Lokasi -->
            <div class="checklist-item">
                <div class="check-box-icon checked">
                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div class="item-content">
                    <span class="item-label">Lokasi</span>
                    <div class="lavender-pill-box">Fontaine, Teyvat</div>
                </div>
            </div>

            <!-- Item 6: Deskripsi -->
            <div class="checklist-item">
                <div class="check-box-icon checked">
                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div class="item-content">
                    <span class="item-label">Deskripsi</span>
                    <div class="lavender-desc-box">
                        Pada Malam dengan badai gemuruh yang tiada henti, air sungai dan laut meluap, banjir yang cukup besar mengangkat pulau dan menenggelamkan sejumlah kota yang ada di wilayah fontaine, pertindakan pemerintah masih di tinjau kembali, namun masyarakat yang berjumlah tak terhingga masih belum di evakuasi secara skala besar. dengan adanya bantuan ini, diharapkan dengan sesama kita dapat bahu membahu sesama masyarakat melalui bantuan seperti tempat yang aman, supply makanan yang cukup, serta pengobatan medis.
                    </div>
                </div>
            </div>

            <!-- Item 7: Jumlah Target Donasi -->
            <div class="checklist-item">
                <div class="check-box-icon checked">
                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div class="item-content">
                    <span class="item-label">Jumlah Target Donasi</span>
                    <div class="lavender-pill-box" style="font-weight: 800; font-size: 1.05rem;">Rp65.000.000</div>
                </div>
            </div>

            <!-- Item 8: Tanggal Penggalangan dana -->
            <div class="checklist-item">
                <div class="check-box-icon checked">
                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div class="item-content">
                    <span class="item-label">Tanggal Penggalangan dana</span>
                    <div class="dates-container">
                        <div class="date-box-col">
                            <span class="date-sublabel">Mulai</span>
                            <div class="date-pill-input">
                                <span>01/10/2026</span>
                                <svg viewBox="0 0 24 24"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                            </div>
                        </div>
                        <div class="date-box-col">
                            <span class="date-sublabel">Berakhir</span>
                            <div class="date-pill-input">
                                <span>30/10/2026</span>
                                <svg viewBox="0 0 24 24"><rect x="3" y="4" width="18" height="18" rx="2"/><line x1="16" y1="2" x2="16" y2="6"/><line x1="8" y1="2" x2="8" y2="6"/><line x1="3" y1="10" x2="21" y2="10"/></svg>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Item 9: Nama Penerima -->
            <div class="checklist-item">
                <div class="check-box-icon checked">
                    <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"/></svg>
                </div>
                <div class="item-content">
                    <span class="item-label">Nama Penerima</span>
                    <span class="item-value-bold">Warga Korban Banjir Fontaine</span>
                </div>
            </div>

            <!-- Item 10: Dokumen Terkait dan Pendukung -->
            <div class="checklist-item">
                <div class="check-box-icon unchecked"></div>
                <div class="item-content">
                    <span class="item-label">Dokumen Terkait dan Pendukung</span>
                    <div class="documents-container">
                        <!-- File 1: KTP -->
                        <div class="doc-file-card" title="Lihat KTP">
                            <div class="doc-file-icon">
                                <svg viewBox="0 0 24 24">
                                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" opacity="0.15"/>
                                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6z" fill="none" stroke="#5c3899" stroke-width="2"/>
                                    <text x="7" y="16" font-size="6" font-weight="900" fill="#5c3899" font-family="inherit">PNG</text>
                                </svg>
                            </div>
                            <span class="doc-file-name">KTP</span>
                        </div>

                        <!-- File 2: Surat ABC -->
                        <div class="doc-file-card" title="Lihat Surat ABC">
                            <div class="doc-file-icon">
                                <svg viewBox="0 0 24 24">
                                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z" opacity="0.15"/>
                                    <path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8l-6-6z" fill="none" stroke="#5c3899" stroke-width="2"/>
                                    <line x1="8" y1="13" x2="16" y2="13" stroke="#5c3899" stroke-width="1.8"/>
                                    <line x1="8" y1="17" x2="13" y2="17" stroke="#5c3899" stroke-width="1.8"/>
                                </svg>
                            </div>
                            <span class="doc-file-name">Surat ABC</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Inspection Progress Bar -->
            <div class="inspection-section">
                <div class="inspection-status-text">Lolos Pemeriksaan 8/10</div>
                <div class="inspection-progress-track">
                    <div class="inspection-progress-fill"></div>
                </div>
            </div>

            <!-- Bottom Action Buttons -->
            <div class="detail-actions-row">
                <button type="button" class="btn-action-setujui" onclick="handleSetujui()">Setujui</button>
                <button type="button" class="btn-action-tolak" onclick="openRejectModal()">Tolak</button>
            </div>
        </div>

    </main>
</div>

<!-- ================= REJECT MODAL (GAMBAR 4) ================= -->
<div class="reject-modal-backdrop" id="rejectModal" role="dialog" aria-modal="true" aria-labelledby="rejectModalTitle">
    <div class="reject-modal-card">
        <h3 class="reject-modal-title" id="rejectModalTitle">
            Apakah Anda Yakin Ingin Menolak dan Menghapus Pengajuan Kampanye
        </h3>

        <div class="reject-modal-campaign-name">
            Bantu Korban Banjir Bandang Fontain
        </div>

        <div class="reject-modal-reason-label">
            Berikan Alasan
        </div>

        <textarea class="reject-modal-textarea" id="rejectReason" rows="3">Dokumen dengan KTP yang Buram, dan dokumentasi Palsu</textarea>

        <button type="button" class="btn-confirm-reject" onclick="handleConfirmReject()">Tolak</button>
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
    // Reject Modal Handlers (Gambar 4)
    function openRejectModal() {
        const modal = document.getElementById('rejectModal');
        if (modal) {
            modal.classList.add('show');
            document.body.style.overflow = 'hidden';
        }
    }

    function closeRejectModal() {
        const modal = document.getElementById('rejectModal');
        if (modal) {
            modal.classList.remove('show');
            document.body.style.overflow = '';
        }
    }

    function handleConfirmReject() {
        const reason = document.getElementById('rejectReason').value;
        // Close modal and redirect back to submissions list
        closeRejectModal();
        alert('Pengajuan Kampanye telah berhasil Ditolak.');
        window.location.href = "{{ route('pengajuan-kampanye') }}";
    }

    function handleSetujui() {
        alert('Pengajuan Kampanye telah berhasil Disetujui dan Aktif.');
        window.location.href = "{{ route('manajemen-kampanye') }}";
    }

    // Logout Modal Handlers
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

    // Close Modals on click outside or Escape
    document.addEventListener('click', function(e) {
        const rejectModal = document.getElementById('rejectModal');
        if (e.target === rejectModal) {
            closeRejectModal();
        }
        const logoutModal = document.getElementById('logoutModal');
        if (e.target === logoutModal) {
            closeLogoutModal();
        }
    });

    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            closeRejectModal();
            closeLogoutModal();
        }
    });
</script>

</body>
</html>

