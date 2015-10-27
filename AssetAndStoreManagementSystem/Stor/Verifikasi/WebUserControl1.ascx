<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="AssetAndStoreManagementSystem.Stor.Verifikasi.WebUserControl1" %>
<%@ Register assembly="DevExpress.Web.v14.2, Version=14.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type="text/css">

.dxflFormLayout_Office2010Blue{
    display: table;
    font: 11px Verdana, Geneva, sans-serif;
	color: #3c3c3c;
}

.dxflGroup_Office2010Blue{ padding: 6px 5px; width: 100%;}
.dxflGroup_Office2010Blue > table.dxflGroupTable_Office2010Blue { width: 100%; }
.dxflVATSys { vertical-align: top; }
.dxflHALSys { text-align: left; }
.dxflGroupCell_Office2010Blue{ padding: 0 8px; }

.dxflGroup_Office2010Blue tr:first-child > .dxflGroupCell_Office2010Blue> .dxflGroupBox_Office2010Blue{ margin-top: 13px; }
.dxflHALSys > table,
.dxflHALSys > div {
    margin-left: 0px;
    margin-right: auto;
}
.dxflGroupBoxSys
{
    box-sizing: border-box;
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
}


.dxflItemSys,
.dxflGroupBoxSys
{
    text-align: left;
}

.dxflGroupBox_Office2010Blue {
    display: table;
    border-collapse: separate;
    width: 100%;
    border: 1px Solid #8BA0BC;
    border-radius: 4px;
    padding: 0 0 12px;
    margin: 10px 0; 
}

.dxflGroupBoxCaption_Office2010Blue{
    background-color: White;
    display: inline-block;  
    left: 9px;
    line-height: 16px;
    padding: 0px 3px 0px 3px;  
    position: relative;
    top: -9px;
}

.dxflGroupBox_Office2010Blue > .dxflGroup_Office2010Blue{ margin-top: -9px; padding: 0 4px; }
.dxflGroupBox_Office2010Blue > .dxflGroup_Office2010Blue tr:first-child > .dxflGroupCell_Office2010Blue> .dxflItem_Office2010Blue{ padding-top: 9px; }

.dxflItem_Office2010Blue{ padding: 2px 0; width: 100%; }
.dxflCustomItemSys .dxflVATSys.dxflCaptionCell_Office2010Blue{ padding-top: 3px; }

.dxflCLTSys .dxflCaptionCell_Office2010Blue,
.dxflCLBSys .dxflCaptionCell_Office2010Blue{
    padding: 3px 0;
}

.dxflCaptionCellSys { /* Bootstrap correction */
    -webkit-box-sizing: content-box;
    -moz-box-sizing: content-box;
    box-sizing: content-box;
}

.dxflCaptionCell_Office2010Blue{
    white-space: nowrap;
    line-height: 16px;
    height: 100%;
    width: 1%;
}
.dxflNestedControlCell_Office2010Blue{
    height: 0;
}

.dxucControl_Office2010Blue,
.dxucEditArea_Office2010Blue,
input[type="text"].dxucEditArea_Office2010Blue /*Bootstrap correction*/
{
	font: 11px Verdana, Geneva, sans-serif;
}

.TextBoxForName 
{
    width:400px;
}

.dxucTextBox_Office2010Blue
{
	background-color: white;
	border: 1px solid #8BA0BC;
	padding: 1px 2px;
}
.dxucEditArea_Office2010Blue,
input[type="text"].dxucEditArea_Office2010Blue /*Bootstrap correction*/
{
    padding: 1px;
}
.dxucTextBox_Office2010Blue .dxucEditArea_Office2010Blue
{
	margin: 0px;
	background-color: white;
}
.dxCB img
{
    vertical-align:middle;
}
.dxWeb_rpHeaderTopLeftCorner_Office2010Blue,
.dxWeb_rpHeaderTopRightCorner_Office2010Blue,
.dxWeb_rpHeaderBottomLeftCorner_Office2010Blue,
.dxWeb_rpHeaderBottomRightCorner_Office2010Blue,
.dxWeb_rpBottomLeftCorner_Office2010Blue,
.dxWeb_rpBottomRightCorner_Office2010Blue,
.dxWeb_rpTopLeftCorner_Office2010Blue,
.dxWeb_rpTopRightCorner_Office2010Blue,
.dxWeb_rpGroupBoxBottomLeftCorner_Office2010Blue,
.dxWeb_rpGroupBoxBottomRightCorner_Office2010Blue,
.dxWeb_rpGroupBoxTopLeftCorner_Office2010Blue,
.dxWeb_rpGroupBoxTopRightCorner_Office2010Blue,
.dxWeb_mHorizontalPopOut_Office2010Blue,
.dxWeb_mVerticalPopOut_Office2010Blue,
.dxWeb_mVerticalPopOutRtl_Office2010Blue,
.dxWeb_mSubMenuItem_Office2010Blue,
.dxWeb_mSubMenuItemChecked_Office2010Blue,
.dxWeb_mScrollUp_Office2010Blue,
.dxWeb_mScrollDown_Office2010Blue,
.dxWeb_tcScrollLeft_Office2010Blue,
.dxWeb_tcScrollRight_Office2010Blue,
.dxWeb_tcScrollLeftHover_Office2010Blue,
.dxWeb_tcScrollRightHover_Office2010Blue,
.dxWeb_tcScrollLeftPressed_Office2010Blue,
.dxWeb_tcScrollRightPressed_Office2010Blue,
.dxWeb_tcScrollLeftDisabled_Office2010Blue,
.dxWeb_tcScrollRightDisabled_Office2010Blue,
.dxWeb_nbCollapse_Office2010Blue,
.dxWeb_nbExpand_Office2010Blue,
.dxWeb_splVSeparator_Office2010Blue,
.dxWeb_splVSeparatorHover_Office2010Blue,
.dxWeb_splHSeparator_Office2010Blue,
.dxWeb_splHSeparatorHover_Office2010Blue,
.dxWeb_splVCollapseBackwardButton_Office2010Blue,
.dxWeb_splVCollapseBackwardButtonHover_Office2010Blue,
.dxWeb_splHCollapseBackwardButton_Office2010Blue,
.dxWeb_splHCollapseBackwardButtonHover_Office2010Blue,
.dxWeb_splVCollapseForwardButton_Office2010Blue,
.dxWeb_splVCollapseForwardButtonHover_Office2010Blue,
.dxWeb_splHCollapseForwardButton_Office2010Blue,
.dxWeb_splHCollapseForwardButtonHover_Office2010Blue,
.dxWeb_pcCloseButton_Office2010Blue,
.dxWeb_pcPinButton_Office2010Blue,
.dxWeb_pcRefreshButton_Office2010Blue,
.dxWeb_pcCollapseButton_Office2010Blue,
.dxWeb_pcMaximizeButton_Office2010Blue,
.dxWeb_pcSizeGrip_Office2010Blue,
.dxWeb_pcSizeGripRtl_Office2010Blue,
.dxWeb_pPopOut_Office2010Blue,
.dxWeb_pPopOutDisabled_Office2010Blue,
.dxWeb_pAll_Office2010Blue,
.dxWeb_pAllDisabled_Office2010Blue,
.dxWeb_pPrev_Office2010Blue,
.dxWeb_pPrevDisabled_Office2010Blue,
.dxWeb_pNext_Office2010Blue,
.dxWeb_pNextDisabled_Office2010Blue,
.dxWeb_pLast_Office2010Blue,
.dxWeb_pLastDisabled_Office2010Blue,
.dxWeb_pFirst_Office2010Blue,
.dxWeb_pFirstDisabled_Office2010Blue,
.dxWeb_tvColBtn_Office2010Blue,
.dxWeb_tvColBtnRtl_Office2010Blue,
.dxWeb_tvExpBtn_Office2010Blue,
.dxWeb_tvExpBtnRtl_Office2010Blue,
.dxWeb_ncBackToTop_Office2010Blue,
.dxWeb_smBullet_Office2010Blue,
.dxWeb_tiBackToTop_Office2010Blue,
.dxWeb_fmFolder_Office2010Blue,
.dxWeb_fmFolderLocked_Office2010Blue,
.dxWeb_fmCreateButton_Office2010Blue,
.dxWeb_fmMoveButton_Office2010Blue,
.dxWeb_fmRenameButton_Office2010Blue,
.dxWeb_fmDeleteButton_Office2010Blue,
.dxWeb_fmRefreshButton_Office2010Blue,
.dxWeb_fmDwnlButton_Office2010Blue,
.dxWeb_fmCreateButtonDisabled_Office2010Blue,
.dxWeb_fmMoveButtonDisabled_Office2010Blue,
.dxWeb_fmRenameButtonDisabled_Office2010Blue,
.dxWeb_fmDeleteButtonDisabled_Office2010Blue,
.dxWeb_fmRefreshButtonDisabled_Office2010Blue,
.dxWeb_fmDwnlButtonDisabled_Office2010Blue,
.dxWeb_fmThumbnailCheck_Office2010Blue,
.dxWeb_ucClearButton_Office2010Blue,
.dxWeb_ucClearButtonDisabled_Office2010Blue,
.dxWeb_isPrevBtnHor_Office2010Blue,
.dxWeb_isNextBtnHor_Office2010Blue,
.dxWeb_isPrevBtnVert_Office2010Blue,
.dxWeb_isNextBtnVert_Office2010Blue,
.dxWeb_isPrevPageBtnHor_Office2010Blue,
.dxWeb_isPrevPageBtnHorOutside_Office2010Blue,
.dxWeb_isNextPageBtnHor_Office2010Blue,
.dxWeb_isNextPageBtnHorOutside_Office2010Blue,
.dxWeb_isPrevPageBtnVert_Office2010Blue,
.dxWeb_isPrevPageBtnVertOutside_Office2010Blue,
.dxWeb_isNextPageBtnVert_Office2010Blue,
.dxWeb_isNextPageBtnVertOutside_Office2010Blue,
.dxWeb_isPrevBtnHorDisabled_Office2010Blue,
.dxWeb_isNextBtnHorDisabled_Office2010Blue,
.dxWeb_isPrevBtnVertDisabled_Office2010Blue,
.dxWeb_isNextBtnVertDisabled_Office2010Blue,
.dxWeb_isPrevPageBtnHorDisabled_Office2010Blue,
.dxWeb_isPrevPageBtnHorOutsideDisabled_Office2010Blue,
.dxWeb_isNextPageBtnHorDisabled_Office2010Blue,
.dxWeb_isNextPageBtnHorOutsideDisabled_Office2010Blue,
.dxWeb_isPrevPageBtnVertDisabled_Office2010Blue,
.dxWeb_isPrevPageBtnVertOutsideDisabled_Office2010Blue,
.dxWeb_isNextPageBtnVertDisabled_Office2010Blue,
.dxWeb_isNextPageBtnVertOutsideDisabled_Office2010Blue,
.dxWeb_isDot_Office2010Blue,
.dxWeb_isDotDisabled_Office2010Blue,
.dxWeb_isDotSelected_Office2010Blue,
.dxWeb_isPlayBtn_Office2010Blue,
.dxWeb_isPauseBtn_Office2010Blue,
.dxWeb_igCloseButton_Office2010Blue,
.dxWeb_igNextButton_Office2010Blue,
.dxWeb_igPrevButton_Office2010Blue,
.dxWeb_igPlayButton_Office2010Blue,
.dxWeb_igPauseButton_Office2010Blue,
.dxWeb_igNavigationBarMarker_Office2010Blue
 { 
    display:block;
}
.dxWeb_ucClearButton_Office2010Blue
{
    background-position: -85px -320px;
    width: 16px;
    height: 16px;
}
.dxigControl_Office2010Blue.dxTouchUI .dxWeb_igCloseButton_Office2010Blue,
.dxigControl_Office2010Blue.dxTouchUI .dxWeb_igPauseButton_Office2010Blue,
.dxigControl_Office2010Blue.dxTouchUI .dxWeb_igPlayButton_Office2010Blue,
.dxpc-collapseBtnChecked .dxWeb_pcCollapseButton_Office2010Blue,
.dxpc-maximizeBtnChecked .dxWeb_pcMaximizeButton_Office2010Blue,
.dxpc-pinBtnChecked .dxWeb_pcPinButton_Office2010Blue,
.dxpnl-btnHover .dxWeb_pnlExpand_Office2010Blue,
.dxpnl-btnHover .dxWeb_pnlExpandArrowBottom_Office2010Blue,
.dxpnl-btnHover .dxWeb_pnlExpandArrowLeft_Office2010Blue,
.dxpnl-btnHover .dxWeb_pnlExpandArrowRight_Office2010Blue,
.dxpnl-btnHover .dxWeb_pnlExpandArrowTop_Office2010Blue,
.dxpnl-btnPressed .dxWeb_pnlExpand_Office2010Blue,
.dxpnl-btnPressed .dxWeb_pnlExpandArrowBottom_Office2010Blue,
.dxpnl-btnPressed .dxWeb_pnlExpandArrowLeft_Office2010Blue,
.dxpnl-btnPressed .dxWeb_pnlExpandArrowRight_Office2010Blue,
.dxpnl-btnPressed .dxWeb_pnlExpandArrowTop_Office2010Blue,
.dxpnl-btnSelected .dxWeb_pnlExpand_Office2010Blue,
.dxpnl-btnSelected .dxWeb_pnlExpandArrowBottom_Office2010Blue,
.dxpnl-btnSelected .dxWeb_pnlExpandArrowLeft_Office2010Blue,
.dxpnl-btnSelected .dxWeb_pnlExpandArrowRight_Office2010Blue,
.dxpnl-btnSelected .dxWeb_pnlExpandArrowTop_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnHover .dxWeb_pnlExpand_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnHover .dxWeb_pnlExpandArrowBottom_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnHover .dxWeb_pnlExpandArrowLeft_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnHover .dxWeb_pnlExpandArrowRight_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnHover .dxWeb_pnlExpandArrowTop_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnPressed .dxWeb_pnlExpand_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnPressed .dxWeb_pnlExpandArrowBottom_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnPressed .dxWeb_pnlExpandArrowLeft_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnPressed .dxWeb_pnlExpandArrowRight_Office2010Blue,
.dxpnl-btnSelected.dxpnl-btnPressed .dxWeb_pnlExpandArrowTop_Office2010Blue,
.dxrpCollapsed .dxWeb_rpCollapseButton_Office2010Blue,
.dxWeb_edtCheckBoxChecked_Office2010Blue,
.dxWeb_edtCheckBoxCheckedDisabled_Office2010Blue,
.dxWeb_edtCheckBoxGrayed_Office2010Blue,
.dxWeb_edtCheckBoxGrayedDisabled_Office2010Blue,
.dxWeb_edtCheckBoxUnchecked_Office2010Blue,
.dxWeb_edtCheckBoxUncheckedDisabled_Office2010Blue,
.dxWeb_fmCopyButton_Office2010Blue,
.dxWeb_fmCopyButtonDisabled_Office2010Blue,
.dxWeb_fmCreateButton_Office2010Blue,
.dxWeb_fmCreateButtonDisabled_Office2010Blue,
.dxWeb_fmDeleteButton_Office2010Blue,
.dxWeb_fmDeleteButtonDisabled_Office2010Blue,
.dxWeb_fmDwnlButton_Office2010Blue,
.dxWeb_fmDwnlButtonDisabled_Office2010Blue,
.dxWeb_fmFolder_Office2010Blue,
.dxWeb_fmFolderLocked_Office2010Blue,
.dxWeb_fmMoveButton_Office2010Blue,
.dxWeb_fmMoveButtonDisabled_Office2010Blue,
.dxWeb_fmRefreshButton_Office2010Blue,
.dxWeb_fmRefreshButtonDisabled_Office2010Blue,
.dxWeb_fmRenameButton_Office2010Blue,
.dxWeb_fmRenameButtonDisabled_Office2010Blue,
.dxWeb_fmThumbnailCheck_Office2010Blue,
.dxWeb_igCloseButton_Office2010Blue,
.dxWeb_igNavigationBarMarker_Office2010Blue,
.dxWeb_igNextButton_Office2010Blue,
.dxWeb_igNextButtonDisabled_Office2010Blue,
.dxWeb_igNextButtonHover_Office2010Blue,
.dxWeb_igNextButtonPressed_Office2010Blue,
.dxWeb_igPauseButton_Office2010Blue,
.dxWeb_igPlayButton_Office2010Blue,
.dxWeb_igPrevButton_Office2010Blue,
.dxWeb_igPrevButtonDisabled_Office2010Blue,
.dxWeb_igPrevButtonHover_Office2010Blue,
.dxWeb_igPrevButtonPressed_Office2010Blue,
.dxWeb_isDot_Office2010Blue,
.dxWeb_isDotDisabled_Office2010Blue,
.dxWeb_isDotPressed_Office2010Blue,
.dxWeb_isDotSelected_Office2010Blue,
.dxWeb_isNextBtnHor_Office2010Blue,
.dxWeb_isNextBtnHorDisabled_Office2010Blue,
.dxWeb_isNextBtnVert_Office2010Blue,
.dxWeb_isNextBtnVertDisabled_Office2010Blue,
.dxWeb_isNextPageBtnHor_Office2010Blue,
.dxWeb_isNextPageBtnHorDisabled_Office2010Blue,
.dxWeb_isNextPageBtnHorOutside_Office2010Blue,
.dxWeb_isNextPageBtnHorOutsideDisabled_Office2010Blue,
.dxWeb_isNextPageBtnVert_Office2010Blue,
.dxWeb_isNextPageBtnVertDisabled_Office2010Blue,
.dxWeb_isNextPageBtnVertOutside_Office2010Blue,
.dxWeb_isNextPageBtnVertOutsideDisabled_Office2010Blue,
.dxWeb_isPauseBtn_Office2010Blue,
.dxWeb_isPlayBtn_Office2010Blue,
.dxWeb_isPrevBtnHor_Office2010Blue,
.dxWeb_isPrevBtnHorDisabled_Office2010Blue,
.dxWeb_isPrevBtnVert_Office2010Blue,
.dxWeb_isPrevBtnVertDisabled_Office2010Blue,
.dxWeb_isPrevPageBtnHor_Office2010Blue,
.dxWeb_isPrevPageBtnHorDisabled_Office2010Blue,
.dxWeb_isPrevPageBtnHorOutside_Office2010Blue,
.dxWeb_isPrevPageBtnHorOutsideDisabled_Office2010Blue,
.dxWeb_isPrevPageBtnVert_Office2010Blue,
.dxWeb_isPrevPageBtnVertDisabled_Office2010Blue,
.dxWeb_isPrevPageBtnVertOutside_Office2010Blue,
.dxWeb_isPrevPageBtnVertOutsideDisabled_Office2010Blue,
.dxWeb_izEWCloseButton_Office2010Blue,
.dxWeb_izHint_Office2010Blue,
.dxWeb_mHorizontalPopOut_Office2010Blue,
.dxWeb_mScrollDown_Office2010Blue,
.dxWeb_mScrollUp_Office2010Blue,
.dxWeb_mSubMenuItem_Office2010Blue,
.dxWeb_mSubMenuItemChecked_Office2010Blue,
.dxWeb_mVerticalPopOut_Office2010Blue,
.dxWeb_mVerticalPopOutRtl_Office2010Blue,
.dxWeb_nbCollapse_Office2010Blue,
.dxWeb_nbExpand_Office2010Blue,
.dxWeb_ncBackToTop_Office2010Blue,
.dxWeb_pAll_Office2010Blue,
.dxWeb_pAllDisabled_Office2010Blue,
.dxWeb_pcCloseButton_Office2010Blue,
.dxWeb_pcCollapseButton_Office2010Blue,
.dxWeb_pcMaximizeButton_Office2010Blue,
.dxWeb_pcPinButton_Office2010Blue,
.dxWeb_pcRefreshButton_Office2010Blue,
.dxWeb_pcSizeGrip_Office2010Blue,
.dxWeb_pcSizeGripRtl_Office2010Blue,
.dxWeb_pFirst_Office2010Blue,
.dxWeb_pFirstDisabled_Office2010Blue,
.dxWeb_pLast_Office2010Blue,
.dxWeb_pLastDisabled_Office2010Blue,
.dxWeb_pNext_Office2010Blue,
.dxWeb_pNextDisabled_Office2010Blue,
.dxWeb_pnlExpand_Office2010Blue,
.dxWeb_pnlExpandArrowBottom_Office2010Blue,
.dxWeb_pnlExpandArrowLeft_Office2010Blue,
.dxWeb_pnlExpandArrowRight_Office2010Blue,
.dxWeb_pnlExpandArrowTop_Office2010Blue,
.dxWeb_pPopOut_Office2010Blue,
.dxWeb_pPopOutDisabled_Office2010Blue,
.dxWeb_pPrev_Office2010Blue,
.dxWeb_pPrevDisabled_Office2010Blue,
.dxWeb_rDialogBoxLauncher_Office2010Blue,
.dxWeb_rDialogBoxLauncherDisabled_Office2010Blue,
.dxWeb_rDialogBoxLauncherHover_Office2010Blue,
.dxWeb_rDialogBoxLauncherPressed_Office2010Blue,
.dxWeb_rMinBtn_Office2010Blue,
.dxWeb_rMinBtn_Office2010Blue.dxWeb_rMinBtnHover_Office2010Blue,
.dxWeb_rMinBtn_Office2010Blue.dxWeb_rMinBtnPressed_Office2010Blue,
.dxWeb_rMinBtnChecked_Office2010Blue.dxWeb_rMinBtn_Office2010Blue,
.dxWeb_rMinBtnChecked_Office2010Blue.dxWeb_rMinBtnDisabled_Office2010Blue,
.dxWeb_rMinBtnChecked_Office2010Blue.dxWeb_rMinBtnHover_Office2010Blue,
.dxWeb_rMinBtnChecked_Office2010Blue.dxWeb_rMinBtnPressed_Office2010Blue,
.dxWeb_rMinBtnDisabled_Office2010Blue,
.dxWeb_rpCollapseButton_Office2010Blue,
.dxWeb_rPopOut_Office2010Blue,
.dxWeb_smBullet_Office2010Blue,
.dxWeb_splHCollapseBackwardButton_Office2010Blue,
.dxWeb_splHCollapseBackwardButtonHover_Office2010Blue,
.dxWeb_splHCollapseForwardButton_Office2010Blue,
.dxWeb_splHCollapseForwardButtonHover_Office2010Blue,
.dxWeb_splHSeparator_Office2010Blue,
.dxWeb_splHSeparatorHover_Office2010Blue,
.dxWeb_splVCollapseBackwardButton_Office2010Blue,
.dxWeb_splVCollapseBackwardButtonHover_Office2010Blue,
.dxWeb_splVCollapseForwardButton_Office2010Blue,
.dxWeb_splVCollapseForwardButtonHover_Office2010Blue,
.dxWeb_splVSeparator_Office2010Blue,
.dxWeb_splVSeparatorHover_Office2010Blue,
.dxWeb_tcScrollLeft_Office2010Blue,
.dxWeb_tcScrollLeftDisabled_Office2010Blue,
.dxWeb_tcScrollLeftHover_Office2010Blue,
.dxWeb_tcScrollLeftPressed_Office2010Blue,
.dxWeb_tcScrollRight_Office2010Blue,
.dxWeb_tcScrollRightDisabled_Office2010Blue,
.dxWeb_tcScrollRightHover_Office2010Blue,
.dxWeb_tcScrollRightPressed_Office2010Blue,
.dxWeb_tiBackToTop_Office2010Blue,
.dxWeb_tvColBtn_Office2010Blue,
.dxWeb_tvColBtnRtl_Office2010Blue,
.dxWeb_tvExpBtn_Office2010Blue,
.dxWeb_tvExpBtnRtl_Office2010Blue,
.dxWeb_ucClearButton_Office2010Blue,
.dxWeb_ucClearButtonDisabled_Office2010Blue
{
    background-image: url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Office2010Blue.Web.sprite.png")%>');
    background-repeat: no-repeat;
    background-color: transparent;
}
img
{
	border-width: 0;
}

.dxucBrowseButton_Office2010Blue
{
	padding: 4px 16px;
	border: 1px solid #ABBAD0;
	background: #D1DFEF url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Office2010Blue.Web.ucButtonBack.png")%>') repeat-x top;
}
.dxucBrowseButton_Office2010Blue,
.dxucBrowseButton_Office2010Blue a
{
	color: #1E395B;
	cursor: pointer;
	white-space: nowrap;
	text-decoration: none;
}
.dxucControl_Office2010Blue .dxucBrowseButton_Office2010Blue a
{
	color: #1E395B;
}
.dxucProgressBar_Office2010Blue
{
	background: #f9f9fa url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Office2010Blue.Web.ucProgressBack.png")%>') repeat-x left top;
	border: 1px solid #a5acb5;

    height: 21px;
}
.dxucProgressBar_Office2010Blue,
.dxucProgressBar_Office2010Blue td.dx
{
	color: #1e395b;
}
.dxucProgressBar_Office2010Blue .dxPBMainCell,
.dxucProgressBar_Office2010Blue td.dx
{
	padding: 0;
}
.dxucProgressBarIndicator_Office2010Blue 
{
	background: #dfe6ed url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Office2010Blue.Web.ucProgressIndicatorBack.png")%>') repeat-x left top;
}
.dxucButton_Office2010Blue,
.dxucButton_Office2010Blue a
{
	color: #1E395B;
	white-space: nowrap;
	text-decoration: none;
}

.dxflTextEditItemSys .dxflVATSys.dxflCaptionCell_Office2010Blue,   /*IE 7*/
.dxflMemoItemSys .dxflVATSys.dxflCaptionCell_Office2010Blue {
    *padding-top: 2px;
}
.dxflTextEditItemSys .dxflVATSys.dxflCaptionCell_Office2010Blue{ padding-top: 3px; }
.dxeTrackBar_Office2010Blue, 
.dxeIRadioButton_Office2010Blue, 
.dxeButtonEdit_Office2010Blue, 
.dxeTextBox_Office2010Blue, 
.dxeRadioButtonList_Office2010Blue, 
.dxeCheckBoxList_Office2010Blue, 
.dxeMemo_Office2010Blue, 
.dxeListBox_Office2010Blue, 
.dxeCalendar_Office2010Blue, 
.dxeColorTable_Office2010Blue
{
	-webkit-tap-highlight-color: rgba(0,0,0,0);
}

.dxeTextBox_Office2010Blue,
.dxeButtonEdit_Office2010Blue,
.dxeIRadioButton_Office2010Blue,
.dxeRadioButtonList_Office2010Blue,
.dxeCheckBoxList_Office2010Blue
{
    cursor: default;
}

.dxeTextBox_Office2010Blue
{
	background-color: white;
	border: 1px solid #8ba0bc;
	font: 11px Verdana, Geneva, sans-serif;
}

.dxeTextBoxSys,
.dxeButtonEditSys 
{
    width: 170px;
}

.dxeTextBoxSys, 
.dxeMemoSys 
{
    border-collapse:separate!important;
}

.dxeTextBoxSys td.dxic
{
    padding: 3px 3px 2px 3px;
    overflow: hidden;
}

.dxeButtonEditSys .dxeEditAreaSys,
.dxeButtonEditSys td.dxic,
.dxeTextBoxSys td.dxic,
.dxeMemoSys td,
.dxeEditAreaSys
{
	width: 100%;
}

input[type="text"].dxeEditArea_Office2010Blue, /*Bootstrap correction*/
input[type="password"].dxeEditArea_Office2010Blue /*Bootstrap correction*/
{
    margin-top: 0;
    margin-bottom: 1px;
}

.dxeMemoEditAreaSys, /*Bootstrap correction*/
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    display: block;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    -webkit-transition: none;
    -moz-transition: none;
    -o-transition: none;
    transition: none;
	-webkit-border-radius: 0px;
    -moz-border-radius: 0px;
    border-radius: 0px;
}
.dxeEditAreaSys,
.dxeMemoEditAreaSys, /*Bootstrap correction*/
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    font: inherit;
    *font: 12px Tahoma, Geneva, sans-serif;

    line-height: normal;
    outline: 0;
}
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    margin-top: 0;
    margin-bottom: 0;
}
.dxeEditAreaSys,
input[type="text"].dxeEditAreaSys, /*Bootstrap correction*/
input[type="password"].dxeEditAreaSys /*Bootstrap correction*/
{
    padding: 0px 1px 0px 0px; /* B146658 */
}
.dxeTextBox_Office2010Blue .dxeEditArea_Office2010Blue
{
	background-color: white;
}
.dxic .dxeEditAreaSys
{
	padding: 0px 1px 0px 0px;
}

.dxeEditArea_Office2010Blue
{
	border: 1px solid #8ba0bc;
}
.dxeEditAreaSys 
{
    border: 0px!important;
    background-position: 0 0; /* iOS Safari */
    -webkit-box-sizing: content-box; /*Bootstrap correction*/
    -moz-box-sizing: content-box; /*Bootstrap correction*/
    box-sizing: content-box; /*Bootstrap correction*/
}

.dxeButtonEdit_Office2010Blue
{
	background-color: white;
	border: 1px solid #8ba0bc;
	font: 11px Verdana, Geneva, sans-serif;

    border-collapse: separate;
    border-spacing: 0;
}

.dxeButtonEditSys 
{
    border-collapse: separate;
    border-spacing: 1px;
}

.DateEditor 
{
    width:130px;
}

.dxeButtonEdit_Office2010Blue td.dxic
{
    padding: 3px 3px 2px 3px;
}
.dxeButtonEditSys td.dxic 
{
    padding: 2px 2px 1px 2px;
    overflow: hidden;
}
.dxeButtonEdit_Office2010Blue .dxeEditArea_Office2010Blue
{
	background-color: white;
}

.dxeButtonEditSys .dxeButton
{
    line-height: 100%;
}

.dxeButtonEditButton_Office2010Blue
{
	padding: 3px 2px 3px 3px;
}

.dxeButtonEditButton_Office2010Blue,
.dxeSpinLargeIncButton_Office2010Blue,
.dxeSpinLargeDecButton_Office2010Blue
{
	background: #c6d7e8 url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Office2010Blue.Editors.edtDropDownBtnBack.png")%>') repeat-x left top;
}
.dxeButtonEditButton_Office2010Blue
{
	border-width: 0 0 0 1px;
}
.dxeCalendarButton_Office2010Blue,
.dxeButtonEditButton_Office2010Blue,
.dxeColorEditButton_Office2010Blue
{
	border-style: solid;
	border-color: #8ba0bc;
}
.dxeButtonEditButton_Office2010Blue,
.dxeCalendarButton_Office2010Blue,
.dxeSpinIncButton_Office2010Blue,
.dxeSpinDecButton_Office2010Blue,
.dxeSpinLargeIncButton_Office2010Blue,
.dxeSpinLargeDecButton_Office2010Blue,
.dxeColorEditButton_Office2010Blue
{
	text-align: center;
	white-space: nowrap;
	vertical-align: middle;
	cursor: pointer;
}
.dxEditors_edtError_Office2010Blue,
.dxEditors_edtCalendarPrevYear_Office2010Blue,
.dxEditors_edtCalendarPrevYearDisabled_Office2010Blue,
.dxEditors_edtCalendarPrevMonth_Office2010Blue,
.dxEditors_edtCalendarPrevMonthDisabled_Office2010Blue,
.dxEditors_edtCalendarNextMonth_Office2010Blue,
.dxEditors_edtCalendarNextMonthDisabled_Office2010Blue,
.dxEditors_edtCalendarNextYear_Office2010Blue,
.dxEditors_edtCalendarNextYearDisabled_Office2010Blue,
.dxEditors_edtCalendarFNPrevYear_Office2010Blue,
.dxEditors_edtCalendarFNNextYear_Office2010Blue,
.dxEditors_edtEllipsis_Office2010Blue,
.dxEditors_edtEllipsisDisabled_Office2010Blue,
.dxEditors_edtDropDown_Office2010Blue,
.dxEditors_edtDropDownDisabled_Office2010Blue,
.dxEditors_edtSpinEditIncrementImage_Office2010Blue,
.dxEditors_edtSpinEditIncrementImageDisabled_Office2010Blue,
.dxEditors_edtSpinEditDecrementImage_Office2010Blue,
.dxEditors_edtSpinEditDecrementImageDisabled_Office2010Blue,
.dxEditors_edtSpinEditLargeIncImage_Office2010Blue,
.dxEditors_edtSpinEditLargeIncImageDisabled_Office2010Blue,
.dxEditors_edtSpinEditLargeDecImage_Office2010Blue,
.dxEditors_edtSpinEditLargeDecImageDisabled_Office2010Blue
{
	display:block;
	margin:auto;
}
.dxEditors_edtDropDown_Office2010Blue
{
    background-position: -11px -259px;
    width: 10px;
    height: 13px;
}
.dxeButtonEditButtonHover_Office2010Blue .dxEditors_edtClear_Office2010Blue,
.dxEditors_caRefresh_Office2010Blue,
.dxEditors_edtCalendarFNNextYear_Office2010Blue,
.dxEditors_edtCalendarFNPrevYear_Office2010Blue,
.dxEditors_edtCalendarNextMonth_Office2010Blue,
.dxEditors_edtCalendarNextMonthDisabled_Office2010Blue,
.dxEditors_edtCalendarNextYear_Office2010Blue,
.dxEditors_edtCalendarNextYearDisabled_Office2010Blue,
.dxEditors_edtCalendarPrevMonth_Office2010Blue,
.dxEditors_edtCalendarPrevMonthDisabled_Office2010Blue,
.dxEditors_edtCalendarPrevYear_Office2010Blue,
.dxEditors_edtCalendarPrevYearDisabled_Office2010Blue,
.dxEditors_edtClear_Office2010Blue,
.dxEditors_edtDETSClockFace_Office2010Blue,
.dxEditors_edtDETSHourHand_Office2010Blue,
.dxEditors_edtDETSMinuteHand_Office2010Blue,
.dxEditors_edtDETSSecondHand_Office2010Blue,
.dxEditors_edtDropDown_Office2010Blue,
.dxEditors_edtDropDownDisabled_Office2010Blue,
.dxEditors_edtEllipsis_Office2010Blue,
.dxEditors_edtEllipsisDisabled_Office2010Blue,
.dxEditors_edtError_Office2010Blue,
.dxEditors_edtRadioButtonChecked_Office2010Blue,
.dxEditors_edtRadioButtonCheckedDisabled_Office2010Blue,
.dxEditors_edtRadioButtonUnchecked_Office2010Blue,
.dxEditors_edtRadioButtonUncheckedDisabled_Office2010Blue,
.dxEditors_edtSpinEditDecrementImage_Office2010Blue,
.dxEditors_edtSpinEditDecrementImageDisabled_Office2010Blue,
.dxEditors_edtSpinEditIncrementImage_Office2010Blue,
.dxEditors_edtSpinEditIncrementImageDisabled_Office2010Blue,
.dxEditors_edtSpinEditLargeDecImage_Office2010Blue,
.dxEditors_edtSpinEditLargeDecImageDisabled_Office2010Blue,
.dxEditors_edtSpinEditLargeIncImage_Office2010Blue,
.dxEditors_edtSpinEditLargeIncImageDisabled_Office2010Blue,
.dxEditors_edtTBDecBtn_Office2010Blue,
.dxEditors_edtTBDecBtnDisabled_Office2010Blue,
.dxEditors_edtTBDecBtnHover_Office2010Blue,
.dxEditors_edtTBDecBtnPressed_Office2010Blue,
.dxEditors_edtTBIncBtn_Office2010Blue,
.dxEditors_edtTBIncBtnDisabled_Office2010Blue,
.dxEditors_edtTBIncBtnHover_Office2010Blue,
.dxEditors_edtTBIncBtnPressed_Office2010Blue,
.dxEditors_edtTokenBoxTokenRemoveButton_Office2010Blue,
.dxEditors_edtTokenBoxTokenRemoveButtonDisabled_Office2010Blue,
.dxEditors_fcadd_Office2010Blue,
.dxEditors_fcaddhot_Office2010Blue,
.dxEditors_fcgroupaddcondition_Office2010Blue,
.dxEditors_fcgroupaddgroup_Office2010Blue,
.dxEditors_fcgroupand_Office2010Blue,
.dxEditors_fcgroupnotand_Office2010Blue,
.dxEditors_fcgroupnotor_Office2010Blue,
.dxEditors_fcgroupor_Office2010Blue,
.dxEditors_fcgroupremove_Office2010Blue,
.dxEditors_fcopany_Office2010Blue,
.dxEditors_fcopbegin_Office2010Blue,
.dxEditors_fcopbetween_Office2010Blue,
.dxEditors_fcopblank_Office2010Blue,
.dxEditors_fcopcontain_Office2010Blue,
.dxEditors_fcopend_Office2010Blue,
.dxEditors_fcopequal_Office2010Blue,
.dxEditors_fcopgreater_Office2010Blue,
.dxEditors_fcopgreaterorequal_Office2010Blue,
.dxEditors_fcopless_Office2010Blue,
.dxEditors_fcoplessorequal_Office2010Blue,
.dxEditors_fcoplike_Office2010Blue,
.dxEditors_fcopnotany_Office2010Blue,
.dxEditors_fcopnotbetween_Office2010Blue,
.dxEditors_fcopnotblank_Office2010Blue,
.dxEditors_fcopnotcontain_Office2010Blue,
.dxEditors_fcopnotequal_Office2010Blue,
.dxEditors_fcopnotlike_Office2010Blue,
.dxEditors_fcremove_Office2010Blue,
.dxEditors_fcremovehot_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBHSys .dxeFocusedMDHSys .dxEditors_edtTBMainDH_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBHSys .dxeFocusedMDHSys .dxEditors_edtTBMainDHHover_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBHSys .dxeFocusedMDHSys .dxEditors_edtTBMainDHPressed_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBHSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDH_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBHSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDHHover_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBHSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDHPressed_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBVSys .dxeFocusedMDHSys .dxEditors_edtTBMainDH_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBVSys .dxeFocusedMDHSys .dxEditors_edtTBMainDHHover_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBVSys .dxeFocusedMDHSys .dxEditors_edtTBMainDHPressed_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBVSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDH_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBVSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDHHover_Office2010Blue,
.dxeFocused_Office2010Blue .dxeTBVSys .dxeFocusedSDHSys .dxEditors_edtTBSecondaryDHPressed_Office2010Blue,
.dxeTBHSys .dxEditors_edtTBMainDH_Office2010Blue,
.dxeTBHSys .dxEditors_edtTBMainDHDisabled_Office2010Blue,
.dxeTBHSys .dxEditors_edtTBMainDHHover_Office2010Blue,
.dxeTBHSys .dxEditors_edtTBMainDHPressed_Office2010Blue,
.dxeTBHSys .dxEditors_edtTBSecondaryDH_Office2010Blue,
.dxeTBHSys .dxEditors_edtTBSecondaryDHDisabled_Office2010Blue,
.dxeTBHSys .dxEditors_edtTBSecondaryDHHover_Office2010Blue,
.dxeTBHSys .dxEditors_edtTBSecondaryDHPressed_Office2010Blue,
.dxeTBVSys .dxEditors_edtTBMainDH_Office2010Blue,
.dxeTBVSys .dxEditors_edtTBMainDHDisabled_Office2010Blue,
.dxeTBVSys .dxEditors_edtTBMainDHHover_Office2010Blue,
.dxeTBVSys .dxEditors_edtTBMainDHPressed_Office2010Blue,
.dxeTBVSys .dxEditors_edtTBSecondaryDH_Office2010Blue,
.dxeTBVSys .dxEditors_edtTBSecondaryDHDisabled_Office2010Blue,
.dxeTBVSys .dxEditors_edtTBSecondaryDHHover_Office2010Blue,
.dxeTBVSys .dxEditors_edtTBSecondaryDHPressed_Office2010Blue
{
    background-image: url('<%=WebResource("DevExpress.Web.ASPxThemes.App_Themes.Office2010Blue.Editors.sprite.png")%>');
    background-repeat: no-repeat;
    background-color: transparent;
}
.dx-wrap, span.dx-wrap
{ 
    white-space: normal!important; 
    line-height: normal;
    padding: 0;
}
</style>

<dx:ASPxFormLayout ID="ASPxFormLayout1" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Muatnaik Oleh" Width="100%" ColCount="2">
            <Items>
                <dx:LayoutItem Caption="Muatnaik Fail Pemeriksaan (CSV)" ColSpan="2" Width="100%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxUploadControl ID="CsvUpload0" runat="server" ClientInstanceName="CsvUpload" CssClass="TextBoxForName" ShowProgressPanel="True" UploadMode="Auto">
                                <ClientSideEvents FileUploadComplete="function(s, e) {
	CsvUpload_FileUploadComplete(s, e);
}" TextChanged="function(s, e) {
	CsvUpload.Upload();
}" />
                                <BrowseButton Text="Pilih Fail">
                                </BrowseButton>
                                <AdvancedModeSettings>
                                    <FileListItemStyle CssClass="pending dxucFileListItem">
                                    </FileListItemStyle>
                                </AdvancedModeSettings>
                            </dx:ASPxUploadControl>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Nama Pemeriksa" Width="20%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxTextBox ID="Result_InvestigatorName" runat="server" CssClass="TextBoxForName" ClientEnabled="False" ClientInstanceName="Result_InvestigatorName" EnableClientSideAPI="True">
                            </dx:ASPxTextBox>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
                <dx:LayoutItem Caption="Tarikh" Width="80%">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxDateEdit ID="Result_PostDate" runat="server" CssClass="DateEditor" DisplayFormatString="dd/MM/yyyy" EditFormat="Custom" EditFormatString="dd/MM/yyyy" ClientEnabled="False" ClientInstanceName="Result_PostDate" EnableClientSideAPI="True">
                            </dx:ASPxDateEdit>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
    </Items>
    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
</dx:ASPxFormLayout>

<dx:ASPxFormLayout ID="ASPxFormLayout2" runat="server" Width="100%">
    <Items>
        <dx:LayoutGroup Caption="Hasil Pemeriksaan" Width="100%" ColCount="3">
            <Items>
                <dx:LayoutItem ColSpan="3" Width="100%" ShowCaption="False">
                    <LayoutItemNestedControlCollection>
                        <dx:LayoutItemNestedControlContainer runat="server">
                            <dx:ASPxGridView ID="GridInspectionResult" runat="server" AutoGenerateColumns="False" ClientInstanceName="GridInspectionResult" Width="100%">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="No Siri Pendaftaran" ShowInCustomizationForm="True" VisibleIndex="0" Width="10%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <cellstyle horizontalalign="Left" verticalalign="Top" wrap="True">
                                        </cellstyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Keterangan Aset" ShowInCustomizationForm="True" VisibleIndex="1" Width="35%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <cellstyle horizontalalign="Left" verticalalign="Top" wrap="True">
                                        </cellstyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status KEWPA2/KEWPA3" ShowInCustomizationForm="True" VisibleIndex="2" Width="10%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <cellstyle horizontalalign="Left" verticalalign="Top" wrap="True">
                                        </cellstyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status Pemeriksaan" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <cellstyle horizontalalign="Left" verticalalign="Top" wrap="True">
                                        </cellstyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Catatan &amp; Cadangan" ShowInCustomizationForm="True" VisibleIndex="4" Width="35%">
                                        <HeaderStyle HorizontalAlign="Left" VerticalAlign="Bottom" Wrap="True" />
                                        <cellstyle horizontalalign="Left" verticalalign="Top" wrap="True">
                                        </cellstyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <settingsbehavior allowfocusedrow="True" />
                                <settingspager mode="ShowAllRecords">
                                </settingspager>
                                <settingsdatasecurity allowdelete="False" allowedit="False" allowinsert="False" />
                                <styles>
                                    <alternatingrow enabled="True">
                                    </alternatingrow>
                                </styles>
                            </dx:ASPxGridView>
                        </dx:LayoutItemNestedControlContainer>
                    </LayoutItemNestedControlCollection>
                </dx:LayoutItem>
            </Items>
        </dx:LayoutGroup>
    </Items>
    <SettingsItems HorizontalAlign="Left" VerticalAlign="Top" />
    <SettingsItemCaptions HorizontalAlign="Left" Location="Top" VerticalAlign="Top" />
</dx:ASPxFormLayout>


