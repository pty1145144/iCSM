// Extend the original processor without changing Source's item/processor ABI.
class CICSMWeaponVisualsDataCompare : public IVisualsDataCompare
{
    CUtlBuffer m_blob;
public:
    void Init(const CUtlBuffer &original, int signature)
    {
        m_blob.CopyBuffer(original);
        m_blob.PutInt(0x4943534d);
        m_blob.PutInt(signature);
    }
    void FillCompareBlob() override {} // immutable snapshot, including quality
    const CUtlBuffer &GetCompareBlob() const override { return m_blob; }
    bool Compare(const CUtlBuffer &other) override
    {
        return m_blob.TellPut() == other.TellPut() &&
            V_memcmp(m_blob.Base(), other.Base(), m_blob.TellPut()) == 0;
    }
};

class CICSMWeaponVisualsDataProcessor : public IVisualsDataProcessor
{
    CCSWeaponVisualsDataProcessor *m_original;
    CICSMWeaponVisualsDataCompare m_qualityCompare;
    const int m_shader;
public:
    CICSMWeaponVisualsDataProcessor(CCSWeaponVisualsDataCompare &&compare,
        const WeaponPaintableMaterial_t *paint, const char *shader)
        : m_original(new CCSWeaponVisualsDataProcessor(Move(compare), paint, shader)),
          m_shader(ICSMSkinQuality::Shader())
    {
        m_qualityCompare.Init(m_original->GetCompareObject()->GetCompareBlob(),
            ICSMSkinQuality::Signature());
    }
    IVisualsDataCompare *GetCompareObject() override { return &m_qualityCompare; }
    bool HasCustomMaterial() const override { return m_original->HasCustomMaterial(); }
    const char *GetOriginalMaterialName() const override { return m_original->GetOriginalMaterialName(); }
    const char *GetOriginalMaterialBaseName() const override { return m_original->GetOriginalMaterialBaseName(); }
    const char *GetPatternVTFName() const override { return m_original->GetPatternVTFName(); }
    void Refresh() override { m_original->Refresh(); }
    KeyValues *GenerateCustomMaterialKeyValues(bool viewModel = false) override
    {
        KeyValues *values = m_original->GenerateCustomMaterialKeyValues(viewModel);
        // Preserve the paint kit's original highlight, normal and wear values.
        // Value 2 opts this finish into the iOS per-material normal-map path.
        if (values && m_shader) values->SetInt("$forcephong", 2);
        return values;
    }
    KeyValues *GenerateCompositeMaterialKeyValues(int parameter) override
    {
        KeyValues *values = m_original->GenerateCompositeMaterialKeyValues(parameter);
        if (values && m_shader) values->SetInt("$cheap", 0);
        return values;
    }
protected:
    ~CICSMWeaponVisualsDataProcessor() override { m_original->Release(); }
};
